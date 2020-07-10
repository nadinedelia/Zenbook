require 'rails_helper'
require 'web_helpers'

feature 'signup page' do
  scenario "user can sign up to Zenbook" do
    signup
    expect(page).to have_current_path('/')
  end
end
  #may need to edit this test if we change root page for the site

  feature 'logout' do
    scenario "user can log out of Zenbook" do
      signup
      click_link 'Logout'
      expect(page).to have_current_path('/login')
    end
  end