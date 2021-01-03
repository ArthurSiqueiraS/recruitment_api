require 'rails_helper'

RSpec.describe "BaseApi", type: :request do
  context 'request api update' do
    before(:all) do
      post '/update_base'
    end

    it 'updates database' do
      expect(response).to have_http_status(:created)
    end

    it 'response data has new candidates list' do
      expect(response.parsed_body['candidates']).to be_an_instance_of(Array)
    end

    it 'response data has new jobs list' do
      expect(response.parsed_body['jobs']).to be_an_instance_of(Array)
    end
  end
end
