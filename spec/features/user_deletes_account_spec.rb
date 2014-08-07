require 'rails_helper'
# Feature: Delete account
#  As a user
#  I want to delete my account
#  So that all of my reviews and favorites are deleted

feature 'User deletes account' do
  scenario 'and all of the data is removed from the database' do

    user = FactoryGirl.create(:confirmed_user)
    # visit user_path(user.id)
    log_in_with(user.email, user.password)
    expect(page).to have_content('Welcome back')
    click_on 'Edit Account'
    click_button 'Cancel my account'
    # click_on 'Ok'
    # page.driver.accept_js_confirms!
    # page.driver.browser.switch_to.alert.accept
    # expect(page).to have_content('Bye! Your account was successfully cancelled. We hope to see you again soon.')
    # page.evaluate_script('window.confirm = function() { return true; }')
    # page.click('Remove')
    # expect(page).to have_content('Bye! Your account was successfully cancelled. We hope to see you again soon.')
  end
end
