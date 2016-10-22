require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:params) do
    { "name": item.name }
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
