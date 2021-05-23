feature "Liking a post" do
  scenario "a user can like a Jam" do
    sign_up
    log_in
    create_jam

    click_button "Like"
    expect(page).to have_content("1 Like")
  end

  scenario "Multiple likes display correctly" do
    sign_up
    log_in
    create_jam

    click_button "Like"
    expect(page).to have_content("1 Like")

    click_button "Like"
    expect(page).to have_content("2 Likes")
  end
    
end
