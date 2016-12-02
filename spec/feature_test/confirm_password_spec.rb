require 'spec_helper'
require_relative '../web-helper.rb'

def failed_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'email', with: 'user@email.com'
  fill_in 'password',  with: 'password'
  fill_in 'password_confirm', with: 'passwords'
  click_button "Sign up"
end

feature 'password confirmation' do
  scenario "I want to see a password confirmation that needs to match" do
    failed_sign_up
    expect{ failed_sign_up }.to change(User, :count).by(0)
  end
end
