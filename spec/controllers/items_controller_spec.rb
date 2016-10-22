require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "GET #query" do
    context 'with no name param' do
      it "returns http success" do
        expect { get :query }.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
