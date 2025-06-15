require 'rails_helper'

RSpec.describe "/quests", type: :request do
  let(:valid_attributes) {
    {
      name: "MyString",
      status: false
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      status: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Quest.create! valid_attributes
      get quests_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      quest = Quest.create! valid_attributes
      get quest_url(quest)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_quest_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      quest = Quest.create! valid_attributes
      get edit_quest_url(quest)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quest" do
        expect {
          post quests_url, params: { quest: valid_attributes }
        }.to change(Quest, :count).by(1)
      end

      it "redirects to root path" do
        post quests_url, params: { quest: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quest" do
        expect {
          post quests_url, params: { quest: invalid_attributes }
        }.to change(Quest, :count).by(0)
      end
    end
  end

  describe "PATCH /toggle_complete" do
    it "toggles the quest status" do
      quest = Quest.create!(valid_attributes)
      expect {
        patch toggle_complete_quest_url(quest)
        quest.reload
      }.to change(quest, :status)
    end

    it "redirects to root path" do
      quest = Quest.create!(valid_attributes)
      patch toggle_complete_quest_url(quest)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PATCH /update" do
    let!(:quest) { Quest.create!(valid_attributes) }

    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Updated Quest", status: true }
      }

      it "updates the requested quest" do
        patch quest_url(quest), params: { quest: new_attributes }
        quest.reload
        expect(quest.name).to eq("Updated Quest")
        expect(quest.status).to be true
      end

      it "redirects to the root path with notice" do
        patch quest_url(quest), params: { quest: new_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Quest was successfully updated.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_update) {
        { name: nil }
      }

      it "does not update the quest" do
        original_name = quest.name
        patch quest_url(quest), params: { quest: invalid_update }
        quest.reload
        expect(quest.name).to eq(original_name)
      end

      it "renders the edit template with status 422" do
        patch quest_url(quest), params: { quest: invalid_update }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quest" do
      quest = Quest.create! valid_attributes
      expect {
        delete quest_url(quest)
      }.to change(Quest, :count).by(-1)
    end

    it "redirects to root path" do
      quest = Quest.create! valid_attributes
      delete quest_url(quest)
      expect(response).to redirect_to(root_path)
    end
  end
end
