class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def index
    # new book部分
    @book = Book.new
    # User info部分
    
    #一覧部分
    @books = Book.all
    
    
  end
  
  def create
    @book = Book.new(book_params)
    if  @book.user_id = current_user.id
      @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      @book.update(book_params)
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy 
    redirect_to '/books' #id指定しないときのredirect_to　URL指定ではないといけないので、path指定
  end 
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
