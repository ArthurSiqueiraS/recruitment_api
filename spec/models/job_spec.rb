require 'rails_helper'

RSpec.describe Job, type: :model do
  context "validations" do
    before(:each) do
      @location = create(:location)
      @exp_range = create(:experience_range)
    end

    it "must have location" do
      job = Job.new(experience_range: @exp_range)
      expect(job.save).to eq(false)
    end

    it "must have experience_range" do
      job = Job.new(location: @location)
      expect(job.save).to eq(false)
    end

    it "can have blank technologies and base_id" do
      job = Job.new(location: @location, experience_range: @exp_range)
      expect(job.save).to eq(true)
    end
  end
end
