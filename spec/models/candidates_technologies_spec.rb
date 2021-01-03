require 'rails_helper'

RSpec.describe CandidatesTechnologies, type: :model do
  before(:each) do
    @candidate = create(:candidate)
    @technology = create(:technology)
  end

  context "before new association" do
    it "candidate has no technologies" do
      expect(@candidate.technologies).to be_empty
    end

    it "technology has no candidates" do
      expect(@technology.candidates).to be_empty
    end
  end

  context "after new association" do
    before(:each) do
      @candidate_technology = CandidatesTechnologies.create(candidate: @candidate, technology: @technology)
    end

    it 'adds technology to candidate' do
      expect(@candidate.technologies).to eq([@technology])
    end

    it 'adds candidate to technology' do
      expect(@technology.candidates).to eq([@candidate])
    end

    it 'main defaults to false' do
      expect(@candidate_technology.main).to eq(false)
    end
  end
end
