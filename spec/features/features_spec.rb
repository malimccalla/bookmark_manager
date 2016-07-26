require 'database_cleaner'

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

feature 'add a link' do
  scenario 'user can create links' do

    visit '/links/new'
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com'
    click_button 'submit'
    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end
end

feature 'add a tag' do
  scenario 'user adds tag to link' do
    visit '/links/new'
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com'
    fill_in :tags, with: 'social'
    click_button 'submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
    # within 'ul#links' do
    #   expect(page).to have_content('social')
    # end
  end
end
