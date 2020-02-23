When("I log out") do
  page.driver.submit :delete, '/users/sign_out', {}
end

When("I log in as {string}") do |email|
  bob = User.find_by(email: email)
  login_as(bob, scope: :user)
end
