require 'rails_helper'

RSpec.describe "quests/index", type: :view do
  before(:each) do
    assign(:quests, [
      Quest.create!(name: "Name", status: false),
      Quest.create!(name: "Name", status: false)
    ])
    assign(:quest, Quest.new)
  end

  it "renders a list of quests" do
    render
    assert_select '[data-test-id^="quest-name-"]', text: /Name/, count: 2
  end
end
