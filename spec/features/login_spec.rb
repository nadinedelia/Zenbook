require 'rails_helper'
require 'web_helpers'

feature 'login page' do
  scenario "user can sign up to Zenbook" do
    user = FactoryBot.create(:user)
    visit (new_user_session_path)
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_current_path('/')
  end
end
