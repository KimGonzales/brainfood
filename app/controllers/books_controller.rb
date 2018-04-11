class BooksController < ApplicationController

  get '/books' do
    (logged_in?) ? (erb :'books/books') : (redirect to '/login')
  end

  #CRUD

  
end 