require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context "validations" do
    before(:each) do
      @location = create(:location)
    end

    it "must have location" do
      candidate = Candidate.new(exp_min: 12)
      expect(candidate.save).to eq(false)
    end

    it "must have exp_min" do
      candidate = Candidate.new(location: @location)
      expect(candidate.save).to eq(false)
    end

    it "can have blank technologies, base_id and exp_max" do
      candidate = Candidate.new(location: @location, exp_min: 12)
      expect(candidate.save).to eq(true)
    end

    context 'experience range validations' do
      before(:each) do
        @candidate = Candidate.new(location: @location)
      end

      it "exp_min has to be lower than exp_max" do
        @candidate.assign_attributes(exp_min: 1, exp_max: 0)
        expect(@candidate.save).to eq(false)
      end

      it "range can't be negative" do
        @candidate.assign_attributes(exp_min: -1, exp_max: 0)
        expect(@candidate.save).to eq(false)
      end
    end
  end
end
