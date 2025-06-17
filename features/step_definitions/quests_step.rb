Given ('I am on the quests page') do
  visit root_path
end

Then ('I should see my profile image') do
  expect(page).to have_css('img[data-test-id="profile-quests-image"]')
end

Then ('I should see my name {string}') do |name|
  expect(page).to have_content(name)
end

Then ('I should see my academy name {string}') do |academy_name|
  expect(page).to have_content(academy_name)
end

Then ('I should see brag button') do
  expect(page).to have_css('a[data-test-id="brag-link"]')
end

Then ('I should see input fields for quest') do
  expect(page).to have_css('input[data-test-id="quest-input"]')
end

Then ('I should see a button to add a new quest') do
  expect(page).to have_button("Add Quest")
end

When ('I fill in the quest input field with {string}') do |quest_name|
  fill_in 'quest_name', with: quest_name
end

When ('I click the {string} button') do |button_text|
  click_button button_text
end

Then ('I should see the quest {string} in the list of quests') do |quest_name|
  expect(page).to have_content(quest_name)
end

Given ('there is a quest {string} in the list') do |quest_name|
  visit root_path
  fill_in 'quest_name', with: quest_name
  click_button 'Add Quest'
end

When ('I check the checkbox for the quest {string}') do |quest_name|
  quest = Quest.find_by(name: quest_name)
  find("[data-test-id='quest-checkbox-#{quest.id}']").click
end

Then('the checkbox for the quest {string} should be checked') do |quest_name|
  quest = Quest.find_by(name: quest_name)
  expect(quest).not_to be_nil, "Quest with name '#{quest_name}' not found"

  checkbox = find("input[data-test-id='quest-checkbox-#{quest.id}']", visible: false)
  expect(checkbox).to be_checked
end

When('I click the delete button for the quest {string}') do |quest_name|
  quest = Quest.find_by(name: quest_name)
  find("a[data-test-id='delete-quest-#{quest.id}']").click
end

Then('I should not see the quest {string} in the list of quests') do |quest_name|
  expect(page).not_to have_css("li[data-test-id='quest-name-#{quest_name.parameterize}']")
end

When('I click the brag button') do
  find("[data-test-id='brag-link']").click
end

Then('I should be redirected to the brag document page') do
  expect(page).to have_current_path('/brag/index')
end

Then('I should see my brag document title {string}') do |title|
  expect(page).to have_content(title)
end

Then('I should see my profile image on the brag document page') do
  expect(page).to have_css("img[data-test-id='profile-brag-image']")
end

Then('I should see content {string}') do |string|
  expect(page).to have_content(string)
end

When('I click the back button on the brag document page') do
  find("[data-test-id='back-to-quests-button']").click
end

Then('I should be redirected back to the quests page') do
  expect(page).to have_current_path(root_path, ignore_query: true)
end
