require 'spec_helper'
require_relative '../web-helper.rb'

feature 'User sign up' do
  scenario "I want to sign-up with an email and password" do
    sign_up
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome user@email.com"
    expect(User.first.email).to eq('user@email.com')
  end
end
