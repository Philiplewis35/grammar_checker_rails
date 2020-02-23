require 'rails_helper'

describe 'session requests' do
  before(:all) do
    @bob = User.find_by(email: 'bob@example.com') || User.create!(email: 'bob@example.com', password: 'Password123', password_confirmation: 'Password123')
  end

  describe 'POST /sign_in' do
    it 'return id and auth token upon successful login' do
      post '/api/v1/sign_in', params:  {email: @bob.email, password: 'Password123'}
      json = JSON.parse(response.body)
      expect(json['email']).to eq @bob.email
      expect(json['authentication_token']).to eq @bob.authentication_token
    end

    it 'return unauthorized upon unsuccessful login' do
      post '/api/v1/sign_in', params:  {email: @bob.email, password: 'wrong password'}
      expect(response.status).to eq 401
    end
  end

  describe 'DELETE /sign_out' do
    before(:each) do
      @headers = {
        "X-User-Email" => @bob.email,
        "X-User-Token" => @bob.authentication_token
      }
    end

    it 'should return okay upon successful sign_out' do
      delete '/api/v1/sign_out', headers: @headers
      expect(response.status).to eq 200
    end

    it 'should return unauthorized upon unsuccessful sign_out' do
      delete '/api/v1/sign_out'
      expect(response.status).to eq 401
    end
  end

  describe 'GET /session_status' do
    before(:each) do
      @headers = {
        "X-User-Email" => @bob.email,
        "X-User-Token" => @bob.authentication_token
      }
    end

    it 'should return ok if current user found' do
      get '/api/v1/session_status', headers: @headers
      expect(response.status).to eq 200
    end

    it 'should return unauthorized if current user not found' do
      get '/api/v1/session_status' # without headers
      expect(response.status).to eq 404
    end
  end
end
