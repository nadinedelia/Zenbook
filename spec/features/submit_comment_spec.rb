require 'rails_helper'
require 'web_helpers'

feature 'commenting on post' do
  scenario 'user can create comment on any post' do
    signup
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Delete me!"
    click_button "Share"
    # expect to stay on same page
    find('.field', match: :first).set("amazing post!")
    click_button "comment"
    expect(page).to have_content("amazing post!")
  end
end
