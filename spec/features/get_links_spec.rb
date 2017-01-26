#require 'spec_helper'

feature 'View Links' do

  before(:each) do
    sign_up
  end

  scenario 'get all stored URL links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/links')

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
