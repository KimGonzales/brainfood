class UsersController < ApplicationController 

  get '/users' do 
    erb :'users/users'
  end 
  
end 