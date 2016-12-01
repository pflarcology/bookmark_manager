feature 'Add mulitple tags' do

  scenario "to a link" do
    visit '/links/new'
    fill_in 'title', :with => 'Facebook'
    fill_in 'url', :with => 'http://www.facebook.com'
    fill_in 'tag', :with => 'social,sports,music'
    click_button('Add')
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
    expect(link.tags.map(&:name)).to include('sports')
    expect(link.tags.map(&:name)).to include('music')
  end

end
