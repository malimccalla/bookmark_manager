feature 'Adding multiple tags' do

  scenario 'I add more than one tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'adventure zombo'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to(include('adventure', "zombo"))
  end
end
