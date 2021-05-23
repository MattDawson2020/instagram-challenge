require_relative "../web_helpers.rb"

feature "User displays picture" do

  scenario "a user's display picture appears next to post" do
  visit '/'
  click_link 'Sign up'

  fill_in "Name", with: "User"
  fill_in "Email", with: "user@gmail.com"
  fill_in "Password", with: "password"
  attach_file "Add a profile picture", "app/assets/images/belcher.jpeg"
  click_button "Submit"

  log_in
  
  expect(page).to have_css("img[src*='belcher.jpeg']")
  end

end
