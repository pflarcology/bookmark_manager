feature "Signing up" do
  scenario "fills in sign up form" do

    visit('/')
    fill_in 'email', :with => "abc@gmail.com"
    fill_in 'password', :with => "password"
    click_button('sign-up')

    expect(page.current_path).to eq '/sign-in'

    visit('/links')


  end

end
