require 'rails_helper'

describe 'User' do
    it 'As a user, I want to create an account, so that I can create reviews and add favorites.' do
    visit '/restaurants'
    expect(page).to have_content('RESTAURANTSSS')
    click_on 'Sign Up'
    # GET /users/new
    fill_in 'Username', with: 'khadijahcc'
    fill_in 'First name', with: 'Khadijah'
    fill_in 'Last name', with: 'Celestine'
    fill_in 'Email address', with: 'khadijahcc@yes.co'
    fill_in 'Password', with: 'khadijah'
    fill_in 'Password confirmation', with: 'khadijah'
    click_on 'Submit'
    # POST /users

  end
end
