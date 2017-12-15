# require 'capybara/rspec'
# require './app/app'
# Capybara.app = BookmarkManager

require 'pry'

feature "adding links to bookmark manager" do

  scenario "add new link" do
    visit('/links')
    find_button('Submit new link').click
  end

  scenario "add a link by title" do
    signup
    click_button 'Submit new link'

    fill_in 'url', with: "https://www.google.com"
    fill_in 'title', with: "Google"
    fill_in 'tags', with: "News"

    click_button 'save'

    expect(current_path).to eq '/links'

    # within 'ul#links' do
      expect(page).to have_content("News")
    # end
  end


end
