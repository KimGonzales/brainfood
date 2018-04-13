class BooksController < ApplicationController

  get '/books' do
    (logged_in?) ? (erb :'books/books') : (redirect to '/login')
  end

  #CRUD

  #------------------------ Create New Books and/or Shelves -----------------------
  get '/books/new' do
    @user = current_user
    erb :'/books/new' 
  end 

  post '/books' do
    @book = Book.create(params[:book])
    redirect to "/books/#{@book.id}"
  end

  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/show_book'
  end

  get '/books/:id/edit' do
    @book = Book.find_by(id: params[:id])
    erb :'/books/edit'
  end 

  patch '/books/:id' do
    book = Book.find_by(id: params[:id])
    book.update(params[:book])
    redirect to "/books/#{book.id}"
  end

  
end 