class ShelvesController < ApplicationController
  #CREATE, READ, UPDATE DELETE

  post '/shelves' do
    @shelf = Shelf.new(params[:shelf])
    current_user.shelves << @shelf
    @shelf.save
    flash[:message] = "You've successfully created your #{@shelf.name} shelf. Please enter your book details."
    erb :'/books/new'
  end 

end
