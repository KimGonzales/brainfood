class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @user = current_user
      erb :'books/books'
    else 
      redirect to '/login'
    end
  end 

  #CRUD

  
end 