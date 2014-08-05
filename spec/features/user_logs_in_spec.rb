# Feature: Log in 
#  As a user 
#  I want to log in
#  So I can review and favorite restaurants

feature 'User logs in' do

  scenario 'with valid information' do
    log_in_with 'khadijahcc', 'password'
    sign_out
  end

  scenario 'with invalid username or password' do
    log_in_with 'khadijahcc', 'password'
    expect(page).to have_content('Sign in')
    sign_out
  end

  scenario 'with blank password' do
    log_in_with 'khadijahcc', 'password'
    expect(page).to have_content('Password can\'t be blank')
    sign_out
  end

  scenario 'and can view other users profiles' do
  end

  scenario 'and cannot edit other users profiles' do
  end

  scenario 'and can like restaurants' do
  end

  scenario 'and can unlike restaurants' do
  end

  scenario 'and can review restaurants' do
  end

  scenario 'and can edit a previously left review' do
  end

end
