require 'rails_helper'
# Feature: Delete account
#  As a user
#  I want to delete my account
#  So that all of my reviews and favorites are deleted

feature 'User deletes account', js: true do
  scenario 'and all of the data is removed from the database' do

    user = FactoryGirl.create(:confirmed_user)
    log_in_with(user.email, user.password)
    expect(page).to have_content('Welcome back')
    click_on 'My Profile'
    click_on 'Edit Account'
    click_button 'Cancel my account'
  end
end
