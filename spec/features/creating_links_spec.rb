# require 'capybara/rspec'
# require './app/app'
# Capybara.app = BookmarkManager

feature "adding links to bookmark manager" do

  scenario "add new link" do
    visit('/links')
    find_button('Submit new link').click
  end

  scenario "add a link by title" do
    visit('/links')
    click_button 'Submit new link'

    fill_in 'url', with: "https://www.google.com"
    fill_in 'title', with: "Google"

    click_button 'save'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content("Google")
    end

  end

end
