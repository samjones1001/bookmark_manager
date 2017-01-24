require 'spec_helper'
require 'database_cleaner'


feature 'Creating links' do

		scenario "Add the site's address and title to bookmark manager" do
		visit('/links/new')
		fill_in('title', with: "Makers Academy")
		fill_in('url', with: "http://www.makersacademy.com")
		click_button('submit')

			expect(current_path).to eq '/links'
			within 'ul#links' do
				expect(page).to have_content("Makers Academy")
				expect(page).to have_content("http://www.makersacademy.com")
			end
		end
end
