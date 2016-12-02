require_relative 'web_helpers'

feature "Password Confirmation" do
  scenario "A mismatching confirmation password does not create a new user" do
    wrong_sign_up
    expect{wrong_sign_up}.to change{User.count}.by 0
    expect(page.current_path).to eq '/sign_in'
    expect(page).to have_content('Password and confirmation password do not match')
  end
end
