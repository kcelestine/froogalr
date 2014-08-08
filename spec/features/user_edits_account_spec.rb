require 'rails_helper'
# Feature: Update
#  As a user
#  I want to edit my account
#  So that all of my information is accurate

feature 'User updates account', js: true do
  scenario 'and changes are reflected in the database' do
    user = FactoryGirl.create(:confirmed_user)
    log_in_with(user.email, user.password)
    expect(page).to have_content('Welcome')
    click_on 'My Profile'
    click_on 'Edit Account'
    fill_in 'Username', with: 'khadthegreat'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'
    expect(page).to have_content('You updated your account successfully.')
  end
end

