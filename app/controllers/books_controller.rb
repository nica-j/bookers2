class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def index
    #一覧部分
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
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
    params.require(:book).permit(:title, :body)
  end
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id #bookのuser情報取得はbook.user_id
      redirect_to books_path
    end
  end
end
