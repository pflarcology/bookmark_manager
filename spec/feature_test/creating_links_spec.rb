require 'spec_helper'

feature "should see form" do
  scenario "When a user visits /links should see" do

      visit '/links/new'
      fill_in 'title', with: 'This is Bing'
      fill_in 'url', with: 'https://www.bing.com'
      click_button 'Bookmark link'


      expect(page.current_path).to eq('/links')

      within 'ol#links' do
        expect(page).to have_content('This is Bing')
      end
    end
  end
