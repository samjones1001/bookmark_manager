feature "User sign in" do
  scenario "authenticating the user before sign in" do
    sign_up
    visit('sessions/new')
    fill_in('email', with: "paulyjgooders@gmail.com")
    fill_in('password', with: "password123")
    click_button("Sign in")
    expect(page).to have_content "Welcome, paulyjgooders@gmail.com"
  end
end
