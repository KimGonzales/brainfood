class BooksController < ApplicationController

  get '/books' do
    (logged_in?) ? (erb :'books/books') : (redirect to '/login')
  end

  #----------------------------------- Create New Books -------------------------------
  
  get '/books/new' do
    login_checkpoint 
    @user = current_user and erb :'/books/new' 
  end 

  post '/books' do
    @user = current_user
    if (!!params[:book][:shelf_id] && has_valid?(params[:shelf])) || (!params[:book][:shelf_id] && !has_valid?(params[:shelf]))
      flash[:message] = "Please Choose or Create ONE Shelf for this Book."
      erb :'/books/new' 

    elsif !!params[:book][:shelf_id] 
      @book = Book.create(params[:book])
      redirect to "/books/#{@book.id}"

    else has_valid?(params[:shelf])
      @book = @user.shelves.create(params[:shelf]).books.create(params[:book])
      redirect to "/books/#{@book.id}"
    end 
    
  end

  #------------------------------------- Show Books -----------------------------------

  get '/books/:id' do
    login_checkpoint
    @book = Book.find(params[:id])
    erb :'/books/show_book'
  end

  #------------------------------------- Edit Books -----------------------------------

  get '/books/:id/edit' do
    login_checkpoint
    @book = Book.find(params[:id])
    if user_permitted_to_edit(@book) then erb :'/books/edit' else redirect to '/books' end 
  end 

  patch '/books/:id' do
    book = current_user.books.find_by(id: params[:id])
    if book.try {|b|b.update(params[:book])}
      redirect to "/books/#{book.id}"
    else 
      flash[:notice] = "You cannot edit someone else's content!"
      redirect to '/profile'
    end 
  end

    #--------------------------------- Delete Books ---------------------------------

  delete '/books/:id/delete' do
    book = current_user.books.find_by(id: params[:id])
    redirect to '/books' if book.nil?
    flash[:notice] = "#{book.title} has been deleted."
    book.destroy and redirect to '/profile'
  end 
  
end 