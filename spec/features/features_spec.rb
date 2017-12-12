require 'capybara/rspec'
require './app/app'

Capybara.app = BookmarkManager

feature "Viewing Links" do

  scenario "it should contain a link" do

    Link.create(url: 'http://makersacademy.com', title: 'Test')

    visit('/links')

    within 'ul#links' do
      expect(page).to have_content('Test')
    end

  end

end
