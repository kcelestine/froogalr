require 'rails_helper'
# Feature: Sign up
#  As a user 
#  I want to sign up
#  So I can visit protected areas of the site

feature 'User signs up' do
  before(:each) do
    visit root_path 
  end

  scenario 'with valid information' do
    sign_up_with 'khadijahcamille', 'Khadijah', 'Celestine', 'valid@example.com', 'password'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please open the     link to activate your account')
  end

  scenario 'with invalid email' do
    sign_up_with 'anamforuser', 'Mauriss', 'Charles', 'invalid_email', 'password'
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'anamforuser', 'Mauriss', 'Charles', 'valid@example.com', ''
    expect(page).to have_content('password can\'t be blank')
  end

end
=begin


  def sign_up_with(username, f_name, l_name, email, password)
    visit restaurants_path
    click_on 'Sign Up' # GET /users/new
    fill_in 'Username', with: username
    fill_in 'First name', with: f_name
    fill_in 'Last name', with: l_name
    fill_in 'Email address', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Submit' # POST /users
  end
=end
