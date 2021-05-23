feature "Creating a post" do
  scenario "a user can post a picture" do
    sign_up
    log_in

    click_link "Create a new Jam"
    attach_file "Image", "app/assets/images/louise.jpeg"
    click_button "Submit"
    expect(page).to have_content "You have created a new post User!"

    expect(page).to have_css("img[src*='louise.jpeg']")
    expect(page).to have_content("Posted by User")
  end

end