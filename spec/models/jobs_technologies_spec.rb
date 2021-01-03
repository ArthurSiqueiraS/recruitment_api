require 'rails_helper'

RSpec.describe JobsTechnologies, type: :model do
  before(:each) do
    @job = create(:job)
    @technology = create(:technology)
  end

  context "before new association" do
    it "job has no technologies" do
      expect(@job.technologies).to be_empty
    end

    it "technology has no jobs" do
      expect(@technology.jobs).to be_empty
    end
  end

  context "after new association" do
    before(:each) do
      @job_technology = JobsTechnologies.create(job: @job, technology: @technology)
    end

    it 'adds technology to job' do
      expect(@job.technologies).to eq([@technology])
    end

    it 'adds job to technology' do
      expect(@technology.jobs).to eq([@job])
    end
  end
end
