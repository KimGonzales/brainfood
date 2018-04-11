require 'spec_helper'

describe UsersController do

  describe 'Signup Page' do

    it 'loads the signup page' do 
      get '/signup'
      expect(last_response.status).to eq(200)
    end

    it 'signup directs user to users index' do 
      params = {
        username: 'ryan',
        email: 'ryan@ryan.com',
        password: '123456'
      }
      post '/signup', params
      expect(last_response.location).to include('/users')
    end

    it 'does not let a user sign up without a username' do
      params = {
        username: '',
        email: 'ryan@ryan.com',
        password: '123456'
        }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without an email' do
      params = {
        username: 'ryan',
        email: '',
        password: '123456'
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a password' do
      params = {
        username: 'ryan',
        email: 'ryan@ryan.com',
        password: ''
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a logged in user view the signup page' do
      user = User.create(username: 'ryan', email: 'ryan@ryan.com', password: '123456')
      params = {
        username: 'ryan',
        email: 'ryan@ryan.com',
        password: '123456'
      }
      post '/signup', params
      session = {}
      session[:user_id] = user.id
      get '/signup'
      expect(last_response.location).to include('/users')
    end
  end 

  describe 'Login' do

    it 'loads the login page' do
      get '/login'
      expect(last_response.status).to eq(200)
    end

    it 'loads the users page after login' do
      user = User.create(username: 'sasha', email: 'sasha@sasha.com', password: '123456')
      params = {
        username: 'sasha',
        password: '123456'
      }
      post '/login', params
      expect(last_response.status).to eq(302)
      follow_redirect!
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Check out what other's are reading")
    end

    it 'does not let user view login page if already logged in' do 
      user = User.create(username: 'sasha', email:'sasha@sasha.com', password: '123456')

      params = {
        username: 'sasha',
        password: '123456'
      }
      post '/login', params
      session ={}
      session[:user_id] = user.id
      get '/login'
      expect(last_response.location).to include('/users')
    end
  end

  describe 'Logout' do
    it 'lets a user logout if they are already logged in' do
      User.create(username: 'sasha', email: 'sasha@sasha.com', password: '123456')

      params = {
        username: 'sasha',
        password: '123456'
      }
      post '/login', params
      get '/logout'
      expect(last_response.location).to include('/login')
    end

    it 'does not let a user logout if not logged in' do
      get '/logout'
      expect(last_response.location).to include('/')
    end

    it 'does not load /users if user not logged in' do
      get '/users'
      expect(last_response.location).to include('/login')
    end

    it 'does load /users if user is logged in' do
      User.create(username: 'sasha',email: 'sasha@sasha.com', password: '123456')
      visit '/login'

      fill_in(:username, with: 'sasha')
      fill_in(:password, with: '123456')
      click_button 'submit'
      expect(page.current_path).to eq('/users')
    end
  end
end