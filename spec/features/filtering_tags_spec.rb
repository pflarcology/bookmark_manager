
feature "filter by tags" do
  scenario "checks that only Links tagged with bubbles are present" do
    visit('/links/new')
    fill_in 'title', :with => 'Facebook'
    fill_in 'url', :with => 'http://www.facebook.com'
    fill_in 'tag', :with => 'social'
    click_button('Add')

    visit('/links/new')
    fill_in 'title', :with => 'Twitter'
    fill_in 'url', :with => 'http://www.twitter.com'
    fill_in 'tag', :with => 'social'
    click_button('Add')

    visit('/links/new')
    fill_in 'title', :with => 'BBC'
    fill_in 'url', :with => 'http://www.bbc.co.uk'
    fill_in 'tag', :with => 'news'
    click_button('Add')

    visit('/links/new')
    fill_in 'title', :with => 'Bubbles'
    fill_in 'url', :with => 'http://www.facebook.com'
    fill_in 'tag', :with => 'bubbles'
    click_button('Add')

    visit ('/tags/bubbles')
    expect(page).to have_content('Bubbles')
    expect(page).not_to have_content('BBC')
    expect(page).not_to have_content('Twitter')
    expect(page).not_to have_content('Facebook')

  end
end
