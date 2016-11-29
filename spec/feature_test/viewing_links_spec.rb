require 'spec_helper'

feature "creating a link" do

   scenario "I can see links on page" do
     Link.create(url: 'https://www.google.com', title: 'Google')
     visit '/links'

    expect(page.status_code).to eq 200

    within 'ol#links' do
      expect(page).to have_content('Google')
    end
  end

end
