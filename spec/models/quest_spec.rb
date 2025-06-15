require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe "Quest success" do
    it "is valid with valid attributes" do
      quest = Quest.new(name: "Test Quest", status: false)
      expect(quest).to be_valid
      expect(quest.name).to eq("Test Quest")
      expect(quest.status).to eq(false)
    end
  end

  describe "Quest validations" do
    it "is valid with a name" do
      quest = Quest.new(name: "Test Quest", status: false)
      expect(quest).to be_valid
      expect(quest.name).to eq("Test Quest")
      expect(quest.status).to eq(false)
    end

    it "is not valid without a name" do
      quest = Quest.new(status: false)
      expect(quest).not_to be_valid
      expect(quest.errors[:name]).to include("can't be blank")
    end

    it "is valid without a status" do
      quest = Quest.new(name: "Test Quest")
      expect(quest).to be_valid
      expect(quest.status).to be_nil
    end
  end
end
