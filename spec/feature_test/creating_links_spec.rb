require 'spec_helper'




feature "creating links" do
  scenario "I want to see the links I created" do

      visit '/links/new'
      fill_in 'title', with: 'This is not Bing'
      fill_in 'url', with: 'https://www.bing.com'
      fill_in 'name', with: 'dsffa'
      click_button 'Create new link'


      expect(page.current_path).to eq('/links')
      within 'ol#links' do
        expect(page).to have_content('This is not Bing')
      end

    end

  end
