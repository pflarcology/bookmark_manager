require_relative 'web_helpers'

feature "Password Confirmation" do
  scenario "A mismatching confirmation password does not create a new user" do
    wrong_sign_up
    expect{wrong_sign_up}.to change{User.count}.by 0
  end
end
