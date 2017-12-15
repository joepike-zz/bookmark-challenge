
feature "User sign up" do

  scenario "I can sign up as a new user" do
    expect { signup }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Joe')
    expect(User.first.email).to eq ('@gmail.com')
    expe
  end

end
