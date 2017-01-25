require 'spec_helper'

feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    
    #visit '/links'
    # this is a *temporary* sanity check - to make sure we
    # can load the page :)
    #expect(page.status_code).to eq 200
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end