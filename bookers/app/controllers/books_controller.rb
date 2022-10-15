class BooksController < ApplicationController

  
  def create
     @newbook = Book.new(list_params)
      if @newbook.save
         flash[:notice] = "Book was successfully registrated"
        redirect_to book_path(@newbook.id)
      else
        @books = Book.all
        render :index
      end
  end
    
  def index
    @books = Book.all
    @newbook = Book.new
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
    flash[:notice] = "Book was successfully deleted"
    redirect_to books_path 
    
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(list_params)
    flash[:notice] = " was successfully updated"
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