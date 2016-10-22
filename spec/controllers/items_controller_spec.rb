require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:params) do
    {
      "query": "can i get a large coffee please",
     "intents":
       [
         {
           "intent": "Order",
           "score": 0.9999995
         },
         {
           "intent": "None",
           "score": 0.0395014025
         }
       ],
     "entities":
       [
         {
          "entity": "large coffee",
          "type": item.name,
          "startIndex": 12,
          "endIndex": 23,
          "score": 0.8477534
         }
       ]
    }
  end

  describe "GET #query" do
    let!(:item) { FactoryGirl.create(:item) }

    context 'with no name param' do
      it "returns a 404" do
        expect { get :query, format: :json }.
          to raise_error(ActionController::RoutingError)
      end
    end

    context 'with a wrong name param' do
      it "returns a 404" do
        expect { get :query, format: :json, name: 'craaaaaazy yeah' }.
          to raise_error(ActionController::RoutingError)
      end
    end

    context 'with a name param' do
      fit "returns http success" do
        get :query, format: :json, params: params
        expect(response).to have_http_status(:success)
        expect(response.body).to match item.name
      end
    end
  end
end
