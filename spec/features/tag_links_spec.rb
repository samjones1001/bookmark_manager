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
	  
	  link = Link.first
      expect(link.tags.map(&:name)).to include('Search Engine')
    end	
end