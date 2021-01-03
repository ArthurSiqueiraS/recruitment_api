require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context "validations" do
    before(:each) do
      @location = create(:location)
      @exp_range = create(:experience_range)
    end

    it "must have location" do
      candidate = Candidate.new(experience_range: @exp_range)
      expect(candidate.save).to eq(false)
    end

    it "must have experience_range" do
      candidate = Candidate.new(location: @location)
      expect(candidate.save).to eq(false)
    end

    it "can have blank technologies and base_id" do
      candidate = Candidate.new(location: @location, experience_range: @exp_range)
      expect(candidate.save).to eq(true)
    end
  end
end
