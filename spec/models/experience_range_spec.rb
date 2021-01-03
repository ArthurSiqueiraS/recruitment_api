require 'rails_helper'

RSpec.describe ExperienceRange, type: :model do
  context "validations" do
    it "must have min_years" do
      exp_range = ExperienceRange.new()
      expect(exp_range.save).to eq(false)
    end

    it "can have blank max_years" do
      exp_range = ExperienceRange.new(min_years: 12)
      expect(exp_range.save).to eq(true)
    end

    it "min_years has to be lower than max_years" do
      exp_range = ExperienceRange.new(min_years: 1, max_years: 0)
      expect(exp_range.save).to eq(false)
    end

    it "range can't be negative" do
      exp_range = ExperienceRange.new(min_years: -1, max_years: 0)
      expect(exp_range.save).to eq(false)
    end
  end
end
