require_relative 'web_helpers'


feature "Signing up" do
  scenario "fills in sign up form" do

    sign_up

    expect(page.current_path).to eq '/links'

    visit('/links')

    expect(page).to have_content("Welcome abc@gmail.com !")

    expect{sign_up}.to change{User.count}.by 1


  end

end
