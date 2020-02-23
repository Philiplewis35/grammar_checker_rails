Before('@bob_exists') do
  User.create!(email: 'bob@example.com', password: 'Password123', password_confirmation: 'Password123')
end

Before('@bob_signed_in') do
  page.driver.submit :delete, '/users/sign_out', {}
  bob = User.find_by(email: 'bob@example.com') || User.create!(email: 'bob@example.com',
                                                              password: 'Password123',
                                                              password_confirmation: 'Password123')
  login_as(bob, scope: :user)
end

Before('@admin_signed_in') do
  page.driver.submit :delete, '/users/sign_out', {}
  bob = User.find_by(email: 'admin@example.com') || User.create!(email: 'admin@example.com',
                                                              password: 'Password123',
                                                              password_confirmation: 'Password123',
                                                              admin: true)
  login_as(bob, scope: :user)
end

Before('@service_exists') do
  Service.create!(base_url: 'https://parser4.herokuapp.com/')
end

Before('@bob_has_a_service') do
  bob = User.find_by(email: 'bob@example.com')
  service = Service.find_by(base_url: 'https://parser4.herokuapp.com/')
  UserService.create!(user_id: bob.id, service_id: service.id)
end
