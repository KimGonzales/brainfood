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
    @shelf = current_user.shelves.find_by(id: params[:id])
    @shelf.update(params[:shelf])
    @shelf.books.create(params[:book])
    flash[:notice] = "You've successfully edited your '#{@shelf.name}' Shelf."
    redirect to "/shelves/#{@shelf.id}"
  end 

  #------------------------------------ Delete Shelves --------------------------------

  delete '/shelves/:id/delete' do 
    @shelf = current_user.shelves.find_by(id: params[:id])
    if @shelf && @shelf.destroy
      flash[:notice] = "You've successfuly Deleted your '#{@shelf.name}' Shelf."
      redirect to '/profile'
    else 
      redirect to "/shelves/#{@shelf.id}"
    end
  end 

end
