class UsersController < ApplicationController

  get '/users' do
    if logged_in?
      @user = current_user
      erb :'users/users'
    else
      redirect to '/login'
    end
  end

  get '/login' do
    redirect to '/users' if logged_in?
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/users'
    else
      erb :'users/login'
    end

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

  get '/logout' do 
    if logged_in? then session.clear and redirect to '/login' else redirect to '/' end
  end
end