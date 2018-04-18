class ShelvesController < ApplicationController

  #------------------------------------- Read Shelves ---------------------------------

  get '/shelves' do 
    redirect to '/profile'
  end 

  get '/shelves/:id' do
    login_checkpoint
    @shelf = Shelf.find_by(id: params[:id])
    erb :'/shelves/show_shelf'
  end

  #------------------------------------- Edit Shelves ---------------------------------

  get '/shelves/:id/edit' do
    @shelf = Shelf.find_by(id: params[:id])
    if user_permitted_to_edit(@shelf) then erb :'/shelves/edit' else redirect to '/books' end
  end

  patch '/shelves/:id' do
    @shelf = Shelf.find_by(id: params[:id])
    @shelf.update(params[:shelf])

    if valid?(params[:book])
      @shelf.books << Book.new(params[:book])
    else 
      flash[:notice] = "Please fill all required book fields to create a new book."
      erb :'/shelves/edit'
    end 

    flash[:notice] = "You've successfully edited your 
      #{@shelf.name} Shelf."
    erb :'shelves/show_shelf'
  end 

  #------------------------------------ Delete Shelves --------------------------------

  delete '/shelves/:id/delete' do 
    shelf = Shelf.find_by(id: params[:id])
    redirect to '/books' if !user_permitted_to_edit(shelf)
    flash[:notice] = "You've successfuly Deleted your
      #{shelf.name} Shelf."
    shelf.destroy
    redirect to '/profile'
  end 

end
