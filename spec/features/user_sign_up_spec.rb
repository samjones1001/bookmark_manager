

feature 'User Sign Up' do
  scenario 'can sign up to the app' do
    #sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, paulyjgooders@gmail.com"

  end

  scenario 'cannot sign up with blank email address' do

      expect { sign_up(email: nil) }.not_to change(User, :count)

  end

  scenario 'cannot sign up with an invalid email address' do

      expect { sign_up(email: "test@test") }.not_to change(User, :count)

  end

  scenario 'cannot sign up with a duplicate email address' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end