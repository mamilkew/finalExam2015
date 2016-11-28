Given(/^I am a normal user$/) do
  @user = FactoryGirl.create :normalUser
end

Given(/^I want to add a new maintenance request$/) do
  @request1 = FactoryGirl.build(:request, user_id: nil)
end

Given(/^I am signed in$/) do
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

When(/^I visit the maintenance page$/) do
  visit '/requests'
end

Then(/^I should see a empty list of maintenance requests$/) do
  expect(page).to have_table
end

Then(/^I should see a link of created request$/) do
  expect(page).to have_link('New Request', href: new_request_path())
end

When(/^I click the link for creating the maintenance requests$/) do
  click_link 'New Request'
end

Then(/^I should see a form to add a requests$/) do
  expect(page).to have_selector('form#new_request')
end

When(/^I submit the form$/) do
  fill_in 'request[topic]', with: @request1.topic
  fill_in 'request[description]', with: @request1.description
  fill_in 'request[location]', with: @request1.location
  fill_in 'request[status]', with: @request1.status
  fill_in 'request[user_id]', with: @user.id
  click_button 'Create Request'
end

Then(/^I should see the result of the action$/) do
  expect(page).to have_content "Topic: #{@request1.topic}"
  expect(page).to have_content "Description: #{@request1.description}"
end

When(/^I click the link for the maintenance requests$/) do
  @r = Request.last
  click_link 'Back'
  expect(page).to have_link('Show', href: request_path(@r.id))
end

Then(/^I should see the details of my maintenance requests$/) do
  find_link('Show', href: request_path(@r.id)).click
  expect(page).to have_content "Topic: #{@r.topic}"
  expect(page).to have_content "Description: #{@r.description}"
  save_and_open_page
end