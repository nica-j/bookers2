class BooksController < ApplicationController
  def show
  end

  def index
    # new book部分
    @book = Book.new
    # User info部分
    
  end
  
  def create
    book = Book.new(book_params)
    book.save
    
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :opinion, :image)
  end
end
