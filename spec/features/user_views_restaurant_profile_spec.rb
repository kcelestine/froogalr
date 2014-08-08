require 'rails_helper'
# Feature: View Restaurant
#  As a user
#  I want to view a restaurants profile page
#  So I can view their ratings and reviews

feature 'User visits a restaurants profile page' do
  before(:each) do
    @user = FactoryGirl.create(:confirmed_user)
    @restaurant = FactoryGirl.create(:restaurant)
  end

  scenario '' do
    log_in_with(@user.email, @user.password)
    visit restaurant_path(@restaurant.id)
  end

  scenario 'and can favorite if logged in' do 
    log_in_with(@user.email, @user.password)
    visit restaurant_path(@restaurant.id)
    click_on 'Favorite'
  end

  scenario 'and can rate if logged in' do
    log_in_with(@user.email, @user.password)
    visit restaurant_path(@restaurant.id)
    choose('review_worth_it_5')
    expect(page).to have_button('Post Review')
  end

  scenario 'and can rate with review if logged in' do
    log_in_with(@user.email, @user.password)
    visit restaurant_path(@restaurant.id)
    expect(page).to have_button('Post Review')
    expect(page).to have_content('Was it worth it?')
  end

  scenario 'and cannot rate, review or favorite if not logged in' do 
    visit restaurant_path(@restaurant.id)
    page.should_not have_content('Favorite')
    page.should_not have_content('Worth it?')
    page.should_not have_content('Review')
  end
end
