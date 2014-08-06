# Feature: Sign up
#  As a user 
#  I want to sign up
#  So I can visit protected areas of the site

feature 'User signs up' do
  before(:each) do
    visit restaurants_path
  end

  scenario 'with valid information' do
    sign_up_with 'khadijahcc', 'Khadijah', 'Celestine', 'valid@example.com', 'password'
    sign_out
  end

  scenario 'with invalid email' do
    sign_up_with 'anamforuser', 'Mauriss', 'Charles', 'invalid_email', 'password'
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'anamforuser', 'Mauriss', 'Charles', 'valid@example.com', ''
    expect(page).to have_content('Password can\'t be blank')
  end

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

  def sign_out
    click_on 'Log Out'
  end
end
