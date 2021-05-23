feature "Editing a user" do
  scenario "a user can edit their profile" do
    sign_up
    log_in

    click_link "Edit user"
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "user@gmail.com"
    fill_in "Password", with: "password"
    attach_file "Add a profile picture", "app/assets/images/belcher.jpeg"
    click_button "Submit"

    expect(page).to have_content("You have successfully edited your account")
    expect(page).to have_content("Bob's profile page")
  end

end
