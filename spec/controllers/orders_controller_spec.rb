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

  describe "POST #show" do
    context 'with a valid order id' do
      it "returns http success" do
        post :new, format: :json

        expect(response).to have_http_status(:success)
        expect(response.body).to match 'false'
      end
    end
  end

  describe "GET #show" do
    context 'with a valid order id' do
      let(:order) { FactoryGirl.create(:order) }
      before do
        FactoryGirl.create_list(:line_item, 3, order: order)
      end

      it "returns http success" do
        get :show, format: :json, id: order.id

        expect(response).to have_http_status(:success)
        expect(response.body).to match 'false'
      end
    end
  end

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
