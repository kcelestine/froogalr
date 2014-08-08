require 'rails_helper'
# Feature: Log in
#  As a user
#  I want to log in
#  So I can review and favorite restaurants

feature 'User logs in', js: true do
  scenario 'with valid information' do
    user = FactoryGirl.create(:confirmed_user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Welcome back')
  end

  scenario 'with invalid email or password' do
    user = FactoryGirl.create(:confirmed_user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '' 
    expect(page).to have_content('Sign in')
  end

  scenario 'and can view other users profiles' do
    log_in
    user = FactoryGirl.create(:confirmed_user2)
    visit user_path(user)
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content('Reviews')
    expect(page).to have_content('Favorites')
  end

  scenario 'and can favorite restaurants' do
    restaurant = FactoryGirl.create(:restaurant)
    user = FactoryGirl.create(:confirmed_user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password 
    click_button 'Sign in'
    visit restaurant_path(restaurant)
    expect(page).to have_content(restaurant.name)
    click_on 'Favorite'
    expect(page).to have_button('Favorite')
  end

  scenario 'and can review restaurants' do
    user = FactoryGirl.create(:confirmed_user)
    restaurant = FactoryGirl.create(:restaurant)
    visit root_path 
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password 
    click_button 'Sign in'
    visit restaurant_path(restaurant)
    expect(page).to have_content(restaurant.name)
    choose 'review_worth_it_5'
    click_on 'Post Review'
    expect(page).to have_content('worth it?')
  end
end
