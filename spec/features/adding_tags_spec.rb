feature "Add tags" do

  scenario "Add a tag to a link" do
  visit('/links/new')
  fill_in('title', with: "Makers Academy")
  fill_in('url', with: "http://www.makersacademy.com")
  fill_in('tags', with: "Education")
  click_button('submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include('Education')

  end

  scenario "Add multiple tags to a link" do
  visit('/links/new')
  fill_in('title', with: "Makers Academy")
  fill_in('url', with: "http://www.makersacademy.com")
  fill_in('tags',  with: 'Education Ruby')
  click_button('submit')
  link = Link.first
  expect(link.tags.map(&:name)).to include('Education', 'Ruby')

  end


end
