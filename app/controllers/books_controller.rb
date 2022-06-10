class BooksController < ApplicationController
  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)and return
    else
      render :index

    end

   if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
   else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
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

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index

    end


    if @book.save
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
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
