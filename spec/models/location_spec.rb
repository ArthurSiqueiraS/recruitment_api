require 'rails_helper'

RSpec.describe Location, type: :model do
  context "validations" do
    it "must have city name" do
      location = Location.new(state: 'SP')
      expect(location.save).to eq(false)
    end

    it "can have blank state" do
      location = Location.new(city: 'Remote')
      expect(location.save).to eq(true)
    end
  end
end
