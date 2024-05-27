require 'rails_helper'

RSpec.describe "Guests", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/guests/show"
      expect(response).to have_http_status(:success)
    end
  end

end
