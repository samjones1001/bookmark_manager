feature 'registering users' do 

  scenario 'regitering a user' do
  	visit('/register')
  	fill_in :email, with: 'my_email@email.com'
  	fill_in :password, with: 'password'
  	expect{ click_button 'Sign up' }.to change(User,:count).by(1)
  	expect(current_path).to eq '/links'
  	expect(page).to have_content('Welcome to bookmark manager, my_email@email.com')
  end
end