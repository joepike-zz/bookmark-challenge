
def signup
  
visit('/signup')

fill_in 'user_name', with: "Joe"
fill_in 'email', with: "@gmail.com"
fill_in 'password', with: "password"

click_button "Signup"

end
