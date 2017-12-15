
feature "Adding tags" do

  scenario "I can add a single tag to a new link" do
    signup

    click_button 'Submit new link'

    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education'

    click_button 'save'
    link = Link.first
    expect(link.tags.map(&:name)).to have_content('education')
  end

end
