feature "Signup" do
  scenario "a user can signup" do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq '/users/new'

    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "password"
    click_button "Submit"

    expect(page).to have_content("You have created your account User")
    expect(current_path).to eq '/'
  end

end
