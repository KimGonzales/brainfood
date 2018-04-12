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
    new_book = Book.create(params)
    redirect to '/books'
  end

  
end 