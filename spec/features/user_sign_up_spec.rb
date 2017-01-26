

feature 'User Sign Up' do
  scenario 'can sign up to the app' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, paulyjgooders@gmail.com"

  end
end
