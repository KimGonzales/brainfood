class UsersController < ApplicationController 

  get '/users' do 
    erb :'users/users'
  end 

  get '/login' do 
    erb :'/users/login'
  end 

  get '/signup' do
    erb :'users/signup' 
  end 

  get '/user/:slug' do
    
    erb :"/users/#{@user.slug}"
  end 
  
end 