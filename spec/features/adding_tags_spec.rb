feature "Add tags" do

  scenario "Add one or more tags to a link" do
  visit('/links/new')
  fill_in('title', with: "Makers Academy")
  fill_in('url', with: "http://www.makersacademy.com")
  fill_in('tag', with: "Education")
  click_button('submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include('Education')

  end
end
