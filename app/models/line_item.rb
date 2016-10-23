class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  after_create :send_notification

  def self.on_line_item_create
    begin
      connection.execute "LISTEN line_item"
      loop do
        connection.raw_connection.wait_for_notify do |event, pid, message|
          yield message
        end
      end
    ensure
      connection.execute "UNLISTEN line_item"
    end
  end

  def self.notify_line_item_created
    connection.execute "NOTIFY line_item, #{connection.quote 'line_item created'}"
  end

  def send_notification
    self.class.notify_line_item_created
  end
end
