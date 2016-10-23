require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let(:item) { FactoryGirl.create(:item) }

  describe "POST #create" do
    context 'with the right params' do
      context 'with no order id' do
        let(:params) do
          {
            item_id: item.id
          }
        end

        it "returns http success and creates a new order" do
          post :create, params: params

          expect(response).to have_http_status(:success)
          expect(response.body).to match item.name
        end
      end

      context 'with an order id' do
        let!(:order) { FactoryGirl.create(:order) }
        let(:params) do
          {
            item_id: item.id,
            order_id: order.id
          }
        end

        it "returns http success and does not create a new order" do
          expect { post :create, params: params }.
            to_not change(Order, :count)

          expect(response).to have_http_status(:success)
          expect(response.body).to match item.name
        end
      end
    end
  end
end
