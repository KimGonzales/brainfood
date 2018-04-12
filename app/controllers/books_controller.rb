class BooksController < ApplicationController

  get '/books' do
    (logged_in?) ? (erb :'books/books') : (redirect to '/login')
  end

  #CRUD

  #------------------------ Create Books -----------------------
  get '/books/new' do
    erb :'/books/new' 
  end 

  post '/books' do
  end

  
end 