

feature "Viewing Links" do

  scenario "it should contain a link" do
    Link.create(url: 'http://makersacademy.com', title: 'Makers Academy')

    visit('/links')

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end

  end

end
