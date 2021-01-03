require 'rails_helper'

RSpec.describe Technology, type: :model do
  context "validations" do
    it "must have name" do
      technology = Technology.new()
      expect(technology.save).to eq(false)
    end

    it "name must be unique" do
      name = 'AWS'
      technology1 = Technology.new(name: name)
      technology2 = Technology.new(name: name)

      expect(technology1.save).to eq(true)
      expect(technology2.save).to eq(false)
    end
  end
end
