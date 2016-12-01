require 'spec_helper'

feature "filtering the links" do
  scenario "i want to group the links by tags" do
    visit '/links/new'
    fill_in 'title', with: 'This is Funny'
    fill_in 'url', with: 'https://www.funny.com'
    fill_in 'name', with: 'bubbles'

    click_button 'Create new link'
    link = Link.first
    visit '/tags/bubbles'
    expect(page).to have_content('https://www.funny.com')
  end
end
