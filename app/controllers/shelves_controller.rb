class ShelvesController < ApplicationController
  #CREATE, READ, UPDATE DELETE

  get '/shelves/new' do
    if logged_in? then erb :'shelves/new' else redirect to '/' end
  end

  post '/shelves' do
    #shelf = Shelf.new(params[:shelf])
    #current_user.shelves << shelf
    binding.pry 

  end 

end
