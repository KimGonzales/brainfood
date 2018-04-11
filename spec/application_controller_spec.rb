require 'spec_helper'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the Homepage' do 
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Welcome to Brainfood!')
    end
  end

  describe 'Signup Page' do

    it 'loads the signup page' do 
      get '/signup'
      expect(last_response.status).to eq(200)
    end
    
    it 'signup directs user to brainfood index' do 
      params = {
        :username => 'ryan',
        :email => 'ryan@ryan.com',
        :password => '123456'
      }
      post '/signup', params
      expect(last_response.location).to include('/users')
    end

    it 'does not let a user sign up without a username' do
      params = {
        :username => "",
        :email => "ryan@ryan.com",
        :password => "123456"
        }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end
  
    it 'does not let a user sign up without an email' do
      params = {
        :username => "ryan",
        :email => "",
        :password => "123456"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a password' do
      params = {
        :username => "ryan",
        :email => "ryan@ryan.com",
        :password => ""
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a logged in user view the signup page' do
      user = User.create(:username => "ryan", :email => "ryan@ryan.com", :password => "123456")
      params = {
        :username => "ryan",
        :email => "ryan@ryan.com",
        :password => "123456"
      }
      post '/signup', params
      session = {}
      session[:user_id] = user.id
      get '/signup'
      expect(last_response.location).to include('/tweets')
    end
  end 
  
end 
        