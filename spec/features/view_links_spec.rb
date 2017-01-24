# As a user,
# So that I can revisit websites which interest me,
# I would like to see a list of links.

feature 'viewing links' do 
  scenario 'links appear on the page' do
  	Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

  	visit '/links'
  	expect(page.status_code).to eq 200
  	within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end

  end
end