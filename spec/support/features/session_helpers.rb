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

    def log_out
      click_on 'Log Out'
    end

  end
end
