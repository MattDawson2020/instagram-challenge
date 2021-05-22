
def sign_up
  visit '/'
  click_link 'Sign up'

  fill_in "Name", with: "User"
  fill_in "Email", with: "user@gmail.com"
  fill_in "Password", with: "password"
  click_button "Create user"
end