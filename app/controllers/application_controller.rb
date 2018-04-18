require 'rack-flash'
class ApplicationController < Sinatra::Base

  configure do 
    set :public_folder, 'public'
    set :views , 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "password_security"
  end 
 
  #-------------------------------------- Go to Index ---------------------------------

  get '/' do
    redirect to '/books' if logged_in?
    erb :index 
  end 

  # -------------------------------------- Helpers -------------------------------------

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!current_user 
  end 

  #checks params are not empty before an instance is created or updated.
  def valid?(params)
    params.none?{|key,value| value.empty?}
  end

  #redirects to the index page if the user is not logged in.
  def login_checkpoint
    redirect to '/' if !logged_in?
  end

  #returns true if user is permitted to change content.
  def user_permitted_to_edit(item)
    item.user == current_user 
  end 

end 