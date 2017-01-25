feature "Add tags" do

  scenario "Add one or more tags to a link" do
  visit('/links/new')
  fill_in('title', with: "Makers Academy")
  fill_in('url', with: "http://www.makersacademy.com")
  fill_in('tag', with: "Education")
  click_button('submit')

    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content("Makers Academy")
      expect(page).to have_content("http://www.makersacademy.com")
      expect(page).to have_content("Education")
    end
  end
end
