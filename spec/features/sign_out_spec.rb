feature 'sign out' do 

  scenario 'a user is able to sign out' do
  	sign_up
    visit('sessions/new')
    fill_in('email', with: "paulyjgooders@gmail.com")
    fill_in('password', with: "password123")
    click_button("Sign in")
    click_button("Sign out")

    expect(page).to have_content 'Goodbye, see you again soon'
    expect(page).not_to have_content 'Welcome, paulyjgooders@gmail.com'
    expect(current_path).to eq '/links'
  end

end