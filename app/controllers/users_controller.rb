class UsersController < ApplicationController
  
  get '/login' do
    redirect to '/books' if logged_in?
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/books'
    else
      flash[:message] = "The username and password you 
        entered did not match our records. Please double-check and try again."
      erb :'users/login'
    end

  end

  get '/signup' do
    redirect to '/books' if logged_in?
    erb :'users/signup'
  end

  post '/signup' do
    if valid?(params)
      @user = User.create(params)
      session[:user_id] = @user.id 
      redirect to '/books'
    else
      redirect to '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else 
      redirect to '/'
    end
  end

end