class BooksController < ApplicationController

  get '/books' do
    (logged_in?) ? (erb :'books/books') : (redirect to '/login')
  end

  #CRUD

  #------------------------ Create Books -----------------------
  get '/books/new' do
    @user = current_user
    erb :'/books/new' 
  end 

  post '/books' do
    
  end

  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/show_book'
  end

  
end 