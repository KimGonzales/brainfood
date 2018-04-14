class ShelvesController < ApplicationController
  #CREATE, READ, UPDATE DELETE

  post '/shelves' do
    @shelf = Shelf.new(params[:shelf])
    @user = current_user
    @user.shelves << @shelf
    @shelf.save
    flash[:message] = "You've successfully created your #{@shelf.name} shelf. 
      Select it below and enter your book details."
    erb :'/books/new'
  end 

  get '/shelves/edit' do
    @user = current_user
    login_checkpoint
    erb :'/shelves/edit' 
  end

  get '/shelves/:id' do 
    @shelf = Shelf.find_by(id: params[:id])
    erb :'/shelves/show_shelf'
  end

  patch '/shelves/:id' do
    shelf = Shelf.find_by(id: params[:id])
    shelf.update(params[:shelf])
    @user = shelf.user
    flash[:notice] = "You've successfully edited your 
      #{shelf.name} Shelf."
    erb :'/users/show'
  end 

  delete '/shelves/:id/delete' do 
    shelf = Shelf.find_by(id: params[:id])
    flash[:notice] = "You've successfuly deleted your
      #{shelf.name} Shelf."
    shelf.destroy
    redirect to '/profile'
  end 

end
