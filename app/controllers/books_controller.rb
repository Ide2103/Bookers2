class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(current_user.id)
  end

  def show
   @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   @book.update(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
end

#ストロングパラメータ
private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end