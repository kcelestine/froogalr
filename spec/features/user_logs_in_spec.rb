require 'rails_helper'

# Feature: Log in
#  As a user
#  I want to log in
#  So I can review and favorite restaurants

feature 'User logs in' do
  before(:each) do
    # log_in
  end

  after(:each) do
    # log_out
  end

  scenario 'with valid information' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid username or password' do
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    expect(page).to have_content('Password can\'t be blank')
  end

  scenario 'and can view other users profiles' do
    visit user_path(1)
    expect(page).to have_content('Welcome to my profile')
  end

  scenario 'and cannot edit other users profiles' do
    visit edit_user_path(1)
    expect(page).to have_content('Access denied')
  end

  scenario 'and can like and unlike restaurants' do
    # create restaurant
    visit restaurant_path(1)
    expect(page).to have_content('Like this restaurant')
    click_on 'Like'
    expect(page).to have_content('Unlike')
    # check_in_db_like(user, restaurant)
    click_on('Unlike')
    # check_in_db_unlike(user, restaurant)
  end

  scenario 'and can review restaurants' do
    # create restaurant
    visit restaurant_path(1)
    expect(page).to have_content('Like this restaurant')
    click_on 'Review'
    expect(page).to have_content('Review')
    # check_in_db_review(user, restaurant)
    click_on('Edit Review')
    # check_in_db_edit_review(user, restaurant)
  end
end
