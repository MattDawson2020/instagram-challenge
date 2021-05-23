feature "Creating comments" do
  scenario "a user can comment on a Jam" do
    sign_up
    log_in
    create_jam

    click_link "Add Comment"
    fill_in "Comment", with: "Where's my burger?"
    click_button "Submit"

    expect(page).to have_css("img[src*='louise.jpeg']")
    expect(page).to have_content("Where's my burger?")
    expect(page).to have_content("--User")
  end

end