require 'rails_helper'

RSpec.describe StateController, type: :controller do

  describe "GET #index" do
    context 'with a valid orders' do
      before do
        FactoryGirl.create_list(:order, 3)
      end

      it "returns http success" do
        patch :index, format: :json

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).fetch('orders').length).to eq 3
      end
    end
  end
end
