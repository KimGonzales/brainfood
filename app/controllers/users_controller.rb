class UsersController < ApplicationController
  
  #---------------------------------------- Log In ------------------------------------
  
  get '/login' do
    redirect to '/books' if logged_in?
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id and redirect to '/books'
    else
      flash[:notice] = "The username and password you entered did not match our 
        records. Please double-check and try again."
      erb :'users/login'
    end
  end

  #---------------------------------------- Sign Up -----------------------------------
 
  get '/signup' do
    redirect to '/books' if logged_in?
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(params)

    if username_exists?(params)
      flash[:taken] = "That username is already taken! Try another."
      erb :'/users/signup'
    elsif @user.save
      session[:user_id] = @user.id
      redirect to '/books'
    else 
      redirect to '/signup'
    end 
    
  end

  #----------------------------------- Show User Page ---------------------------------

  get '/profile' do
    login_checkpoint
    @user = current_user
    erb :'/users/show'
  end 

  get '/users/:slug' do
    login_checkpoint
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  #--------------------------------------- Log Out ------------------------------------

  get '/logout' do
    login_checkpoint
    session.clear
    redirect to '/login'
  end

end