# As a user
# So i can can organise my bookmarks
# I want to add tags to links

feature 'add tags to links' do
	scenario 'set up a bookmark with a tag' do
	  visit '/new'
	  fill_in :url, with: 'http://www.google.com'
	  fill_in :title, with: 'Google'
	  fill_in :tags, with: 'Search Engine'
	  click_button 'Add Link'

	  expect(page).to have_content('Search Engine')
    end

    scenario 'add multiple tags to a link' do
    	visit '/new'
    	fill_in :url, with: 'http://www.google.com'
	  	fill_in :title, with: 'Google'
	  	fill_in :tags, with: 'Search Engine,Coding advice'
	  	click_button 'Add Link'

    	expect(Tag.all.map(&:name)).to include('Coding advice', 'Search Engine')

    	expect(page).to have_content("Search Engine, Coding advice")
    end
end
