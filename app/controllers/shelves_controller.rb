class ShelvesController < ApplicationController
  #CREATE, READ, UPDATE DELETE

  get '/shelves/new' do
    if logged_in? then erb :'shelves/new' else redirect to '/' end
  end

  post '/shelves' do
    #if params are empty, flash message and ask user to provide a valid name
    #shelf = Shelf.new(params[:shelf])
    #current_user.shelves << shelf
    binding.pry 

  end 

end
