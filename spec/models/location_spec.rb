require 'rails_helper'

RSpec.describe Location, type: :model do
  context "validations" do
    it "must have city name" do
      location = Location.new(state: 'SP')
      expect(location.save).to eq(false)
    end

    it "must have state" do
      location = Location.new(city: 'São Paulo')
      expect(location.save).to eq(false)
    end
  end
end
