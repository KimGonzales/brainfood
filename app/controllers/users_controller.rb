class UsersController < ApplicationController 

  get '/users' do 
    erb :'users/users'
  end 

  get '/login' do 
    erb :'/users/login'
  end 

  get '/signup' do
    redirect to '/users' if logged_in? 
    erb :'users/signup'
  end 

  post '/signup' do
    if valid?(params)
      @user = User.create(params)
      session[:user_id] = @user.id 
      redirect to '/users'
    else 
      redirect to '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end 
  
end 