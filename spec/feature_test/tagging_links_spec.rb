require 'spec_helper'

feature "should see form" do
  scenario "When a user visits /links should see" do

      visit '/links/new'
      fill_in 'title', with: 'This is Bing'
      fill_in 'url', with: 'https://www.bing.com'
      fill_in 'name', with: 'hey'

      click_button 'Create new link'
      link = Link.first
      expect(link.tags.map(&:name)).to include 'hey'


    end

  end
