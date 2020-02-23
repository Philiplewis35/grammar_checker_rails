require 'rails_helper'

describe 'services requests' do
  before(:each) do
    @bob = User.find_by(email: 'bob@example.com') || User.create!(email: 'bob@example.com', password: 'Password123', password_confirmation: 'Password123')
    @service = Service.find_or_create_by!(base_url: 'https://parser4.herokuapp.com/')

    @headers = {
      "X-User-Email" => @bob.email,
      "X-User-Token" => @bob.authentication_token
    }
  end

  describe 'GET /index' do
    it 'should return the list of the current users services' do
      UserService.create!(user_id: @bob.id, service_id: @service.id) 
      get '/api/v1/services', headers: @headers
      json = JSON.parse(response.body)
      expect(json).to eq @bob.services.map(&:base_url)
    end

    it 'should return 401 if the current user cannot be found' do
      get '/api/v1/services' # no headers
      expect(response.status).to be 401
    end
  end
end
