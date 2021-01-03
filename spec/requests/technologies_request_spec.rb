require 'rails_helper'

RSpec.describe "Technologies", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/technologies/index"
      expect(response).to have_http_status(:success)
    end
  end

end
