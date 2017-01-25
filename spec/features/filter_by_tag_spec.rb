feature 'Filter by Tag' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  end

  scenario "can filter links by tag" do

    visit('/tags/education')

    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).not_to have_content('Google')
      expect(page).to have_content('Makers Academy')
    end

  end
end
