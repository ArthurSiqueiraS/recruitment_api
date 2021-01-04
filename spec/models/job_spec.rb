require 'rails_helper'

RSpec.describe Job, type: :model do
  context "validations" do
    before(:each) do
      @location = create(:location)
    end

    it "must have exp_min" do
      job = Job.new()
      expect(job.save).to eq(false)
    end

    it "can have blank location, technologies, base_id and exp_max" do
      job = Job.new(exp_min: 12)
      expect(job.save).to eq(true)
    end

    context 'experience range validations' do
      before(:each) do
        @job = Job.new(location: @location)
      end

      it "exp_min has to be lower than exp_max" do
        @job.assign_attributes(exp_min: 1, exp_max: 0)
        expect(@job.save).to eq(false)
      end

      it "range can't be negative" do
        @job.assign_attributes(exp_min: -1, exp_max: 0)
        expect(@job.save).to eq(false)
      end
    end
  end
end
