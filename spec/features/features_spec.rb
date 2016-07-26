require 'spec_helper'

feature 'display links' do
  scenario 'it displays links' do
    Link.create(url: 'http://www.bcc.co.uk/news', title: 'What is this???')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('What is this???')
    end
  end
end
