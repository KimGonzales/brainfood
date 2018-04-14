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

end
