require 'rails_helper'

RSpec.describe "Candidates", type: :request do
  describe "get candidates" do
    before(:all) do
      Array(1..20).each { create(:candidate) }
      get '/candidates'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
