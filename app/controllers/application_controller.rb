require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base 
  configure do 
    set :public_folder, 'public'
    set :views , 'app/views'
    enable :sessions 
    set :session_secret, "password_security"
  end 

  get '/' do 
    erb :index 
  end 

  # ------------------ Helpers ---------------
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!current_user 
  end 

  def valid?(params)
    !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
  end

  def authenticate_user_success?(params)
    user = User.find_by(username: params[:username])
    !!user && user.authenticate(params[:password])
  end 

end 