class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "登録しました。", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "更新しました。", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "削除しました。"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :price)
  end
end