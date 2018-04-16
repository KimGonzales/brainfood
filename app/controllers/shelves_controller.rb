class ShelvesController < ApplicationController

  get '/shelves' do 
    redirect to '/profile'
  end 

  post '/shelves' do
    # @shelf = Shelf.new(params[:shelf])
    # @user = current_user
    # @user.shelves << @shelf
    # @shelf.save
    # flash[:message] = "You've successfully created your #{@shelf.name} shelf. 
    #   Select it below and enter your book details."
    # erb :'/books/new'
  end 


  get '/shelves/:id' do
    login_checkpoint
    @shelf = Shelf.find_by(id: params[:id])
    erb :'/shelves/show_shelf'
  end

  get '/shelves/:id/edit' do
    @shelf = Shelf.find_by(id: params[:id])
    erb :'/shelves/edit' 
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

  delete '/shelves/:id/delete' do 
    shelf = Shelf.find_by(id: params[:id])
    flash[:notice] = "You've successfuly Deleted your
      #{shelf.name} Shelf."
    shelf.destroy
    redirect to '/profile'
  end 

end
