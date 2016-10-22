require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #finish" do
    context 'with a valid order' do
      let(:order) { FactoryGirl.create(:order) }

      it "returns http success" do
        expect(order.finished).to be false
        patch :finish, format: :json, id: order.id

        expect(response).to have_http_status(:success)
        expect(response.body).to match 'true'
        order.reload
        expect(order.finished).to be true
      end
    end
  end
end
