require 'sinatra/base'
class BooksController < ApplicationController

  get '/books' do
    (logged_in?) ? (erb :'books/books') : (redirect to '/login')
  end

  #CRUD

  #---------------------------- Create New Books ------------------------------
  
  get '/books/new' do
    @user = current_user
    erb :'/books/new' 
  end 

  post '/books' do
    @book = Book.create(params[:book])
    redirect to "/books/#{@book.id}"
  end

  get '/books/:id' do
    login_checkpoint
    @book = Book.find_by_id(params[:id])
    erb :'/books/show_book'
  end

  get '/books/:id/edit' do
    login_checkpoint
    @book = Book.find_by(id: params[:id])
    erb :'/books/edit'
  end 

  patch '/books/:id' do
    book = Book.find_by(id: params[:id])
    book.update(params[:book])
    redirect to "/books/#{book.id}"
  end

  delete '/books/:id/delete' do 
    book = Book.find_by(id: params[:id])
    flash[:notice] = "#{book.title} has been deleted."
    book.delete
    @user = current_user
    erb :'/users/show'
  end 
  
end 