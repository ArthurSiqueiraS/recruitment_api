require 'rails_helper'

RSpec.describe "Candidates", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/candidates/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/candidates/show"
      expect(response).to have_http_status(:success)
    end
  end

end
