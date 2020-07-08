def signup
    visit ('/signup')
    fill_in 'user_name', with: 'Dave'
    fill_in 'email', with: 'dave@test.co.uk'
    fill_in 'password', with: 'TestPasW0rd'
    fill_in 'user_password_confirmation', with: 'TestPasW0rd'
    click_button 'Sign up'
end