require 'rails_helper'

RSpec.describe "Candidates", type: :request do
  describe "get candidates" do
    before(:all) do
      Array(1..20).each { create(:candidate) }
    end

    it "returns http success" do
      get '/candidates'
      expect(response).to have_http_status(:success)
    end

    context 'invalid params' do
      it "returns bad request if technologies is present and isn't an array" do
        get '/candidates', params: { technologies: 1, experienceRange: [0, 1], locations: 1 }
        expect(response).to have_http_status(:bad_request)
      end

      it "returns bad request if experience range is present and isn't an array" do
        get '/candidates', params: { technologies: [1], experienceRange: 0, locations: 1 }
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'valid params' do
      it "returns success for valid query params" do
        get '/candidates', params: { technologies: [1], experienceRange: [0, 1], locations: 1 }
        expect(response).to have_http_status(:success)
      end

      it "returns success for semantically incorrect params" do
        get '/candidates', params: { technologies: ['A'], experienceRange: ['A', 'B'], locations: 'A' }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
