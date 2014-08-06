module Features
  module SessionHelpers
    def log_in
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
    
    def log_in_with(username, password)
      visit root_path
      click_on 'Log In' # GET /users/new
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      click_on 'Log In' # POST /users
    end

    def sign_up
    # A message with a confirmation link has been sent to your email address. Please open the link to activate your account
    end
    def log_out
      click_on 'Sign out'
    end

  end
end
