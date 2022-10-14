class BooksController < ApplicationController
  def new
    @books = Book.all
    @book = Book.new
  end
  
  def create
     @book = Book.new(list_params)
      if @book.save
         flash[:notice] = "Operation was successfully completed"
        redirect_to book_path(@book.id)
      else
        render :new
      end
  end
    
  def index
    @books = Book.all
    @book = Book.find_by(params[:id])
  
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Operation was successfully completed"
    redirect_to new_book_path 
    
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(list_params)
    flash[:notice] = "Operation was successfully completed"
    redirect_to book_path(@book.id) 
    else
      render :edit
    end  
  end
  
end

  private
  def list_params
    params.require(:book).permit(:title, :body)
  end