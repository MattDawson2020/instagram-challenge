feature "Creating jams" do
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

  scenario "a user can post a picture with a caption" do
    sign_up
    log_in

    click_link "Create a new Jam"
    fill_in "Caption", with: "Suprise!"
    attach_file "Image", "app/assets/images/louise.jpeg"
    click_button "Submit"

    expect(page).to have_content("Suprise!")
  end

  scenario "a user can create multiple posts and see them on an index page" do
    sign_up
    log_in
    create_jam

    visit '/'
    log_in
    create_second_jam
    click_link "See other Jams"

    expect(current_path).to eq '/jams'
    expect(page).to have_content("Suprise!")
    expect(page).to have_content("Do you think horses get songs stuck in their heads?")
    expect(page).to have_css("img[src*='louise.jpeg']")
    expect(page).to have_css("img[src*='tina.jpeg']")
  end


end