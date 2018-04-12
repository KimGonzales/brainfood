class ShelvesController < ApplicationController
  #CREATE, READ, UPDATE DELETE

  get '/shelves/new' do
    if logged_in? then erb :'shelves/new' else redirect to '/' end
  end

  post '/shelves' do
    @shelf = Shelf.new(params[:shelf])
    current_user.shelves << @shelf
    @shelf.save
    redirect to "/users/#{current_user.slug}"
  end 

end
