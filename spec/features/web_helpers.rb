def sign_up

  visit('/users/new')
  fill_in 'email', :with => "abc@gmail.com"
  fill_in 'password', :with => "password"
  click_button('sign-up')
  
end
