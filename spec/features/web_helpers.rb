def sign_up
  visit('/users/new')
  fill_in 'email', :with => "abc@gmail.com"
  fill_in 'password', :with => "password"
  fill_in 'confirm_password', :with => "password"
  click_button('sign-up')
end

def wrong_sign_up
  visit('/users/new')
  fill_in 'email', :with => "abc@gmail.com"
  fill_in 'password', :with => "password"
  fill_in 'confirm_password', :with => "pssword"
  click_button('sign-up')
end
