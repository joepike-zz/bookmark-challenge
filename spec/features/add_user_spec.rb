
feature "Add user" do

  scenario "New user signs up" do

    signup

    expect(current_path).to eq '/links'

    expect(page).to have_content "Welcome Joe"

  end

end
