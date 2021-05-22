feature "Signup" do
  scenario "a user can signup" do
    visit '/'
    click_link 'Sign up'
    # expect(current_path).to eq '/signup'

    fill_in "Name", with: "User"
    fill_in "Email", with: "user@mail.com"
    fill_in "Password", with: "password"
    click_button "Create user"

    expect(page).to have_content("You have created your account User")
    expect(current_path).to eq '/'
  end

end
