require 'spec_helper'

feature 'quickly access regular websites' do
  scenario 'would like to view a lisk of links on the homepage' do
    Link.create(url:'http://www.bbc.co.uk', title: 'BBC')
    visit '/'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
