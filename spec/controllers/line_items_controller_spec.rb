require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let(:item) { FactoryGirl.create(:item) }

  describe "POST #create" do
    context 'with the right params' do
      let(:params) do
        {
          item_id: item.id
        }
      end

      context 'with no order id' do
        it "returns http success and creates a new order" do
          post :create, params: params

          expect(response).to have_http_status(:success)
          expect(response.body).to match item.name
        end
      end
    end
  end
end
