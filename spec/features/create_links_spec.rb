# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'add new links' do
	scenario 'add new links to the list' do
	  visit '/links/new'
	  fill_in :url, with: 'http://www.google.com'
	  fill_in :title, with: 'Google'
	  click_button 'Add Link'
	  expect(current_path).to eq '/links'
	  within 'ul#links' do
        expect(page).to have_content('Google')
      end
	end
end
