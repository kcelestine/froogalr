require 'rails_helper'
# Feature: Search
#  As a user
#  I want to search for restaurants
#  So I can view them on the map

feature 'searches for restaurants via zip code' do
  scenario 'and it displays on the map' do
    visit restaurants_path
    fill_in 'search', with: '10010'
    click_button 'Search By Zip Code'
    # puts things on map
    # page.response_headers.should include('yes')
  end
end
