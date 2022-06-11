class BooksController < ApplicationController

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book.id)and return
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)

    if book.save
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(book.id)and return
    else
      @book = Book.find(params[:id])
      render :show
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
