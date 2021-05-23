
def sign_up
  visit '/'
  click_link 'Sign up'

  fill_in "Name", with: "User"
  fill_in "Email", with: "user@gmail.com"
  fill_in "Password", with: "password"
  attach_file "Add a profile picture", "app/assets/images/belcher.jpeg"
  click_button "Submit"
end

def log_in
  fill_in "Name", with: "User"
  fill_in "Email", with: "user@gmail.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

def create_jam
  click_link "Create a new Jam"
  fill_in "Caption", with: "Suprise!"
  attach_file "Image", "app/assets/images/louise.jpeg"
  click_button "Submit"
end

def create_second_jam
  click_link "Create a new Jam"
  fill_in "Caption", with: "Do you think horses get songs stuck in their heads?"
  attach_file "Image", "app/assets/images/tina.jpeg"
  click_button "Submit"
end