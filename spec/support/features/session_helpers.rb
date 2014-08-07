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
      click_on 'Sign in' # GET /users/new
      fill_in 'Email', with: username
      fill_in 'Password', with: password
      click_button 'Sign in' # POST /users
    end

    def sign_up_with(username, first_name, last_name, email, password)
      visit root_path
      click_on 'Sign up'
      fill_in 'Username', with: username
      fill_in 'First name', with: first_name 
      fill_in 'Last name', with: last_name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end


  end
end
