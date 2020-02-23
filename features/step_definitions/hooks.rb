Before('@bob_exists') do
  User.create!(email: 'bob@example.com', password: 'Password123', password_confirmation: 'Password123')
end

Before('@bob_signed_in') do
  bob = User.find_by(email: 'bob@example.com') || User.create!(email: 'bob@example.com',
                                                              password: 'Password123',
                                                              password_confirmation: 'Password123')
  login_as(bob, scope: :user)
end

Before('@admin_signed_in') do
  bob = User.find_by(email: 'admin@example.com') || User.create!(email: 'admin@example.com',
                                                              password: 'Password123',
                                                              password_confirmation: 'Password123',
                                                              admin: true)
  login_as(bob, scope: :user)
end

Before('@service_exists') do
  Service.create!(base_url: 'https://parser4.herokuapp.com/')
end
