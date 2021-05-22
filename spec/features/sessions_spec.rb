feature "Sessions" do
  scenario "a user can login" do
    sign_up

    fill_in "Name", with: "User"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content("Welcome User!")
    # expect(current_path).to eq '/james/index'
  end

end
