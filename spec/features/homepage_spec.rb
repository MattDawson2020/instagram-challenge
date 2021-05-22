feature "Homepage" do
  scenario "a user can see homepage options" do
    visit '/'

    expect(page).to have_content("Sign up")
    expect(page).to have_content("Log in")
    expect(page).to have_content("InstaJam")
  end

end
