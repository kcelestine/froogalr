require 'rails_helper'
# Feature: Log in
#  As a user
#  I want to log in
#  So I can review and favorite restaurants

feature 'User logs in' do
  before(:each) do
    log_in
  end

  after(:each) do
    # log_out
  end

  scenario 'with valid information' do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
  end

  scenario 'with invalid username or password' do
    expect(page).to have_content('Sign in')
  end

  scenario 'and can view other users profiles' do
    user = FactoryGirl.build(:confirmed_user)
    visit user_path(user)
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content('Reviews')
    expect(page).to have_content('Favorites')
  end

  scenario 'and cannot edit other users profiles' do
    visit edit_user_registration_path(2)
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'and can like and unlike restaurants' do
    # create restaurant
    visit restaurant_path(Restaurant.first)
    click_on 'Favorite'
    # check_in_db_like(user, restaurant)
    click_on('Unfavorite')
    # check_in_db_unlike(user, restaurant)
  end

  scenario 'and can review restaurants' do
    # create restaurant
    visit restaurant_path(Restaurant.first)
    click_on 'Review'
    expect(page).to have_content('Review')
    # check_in_db_review(user, restaurant)
    click_on('Edit Review')
    # check_in_db_edit_review(user, restaurant)
  end
end
