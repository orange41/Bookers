class BooksController < ApplicationController
  def top
    render 'top.html.erb'
  end

 def new
  @book = Book.new  # @bookを作成
 end

def create
  @new_book = Book.new(book_params)

  if @new_book.save
    redirect_to @new_book, notice: 'Book was successfully created.'
  else
    flash.now[:alert] = 'Failed to create book.'
    @books = Book.all  # エラーメッセージを表示するために、@booksを取得して渡す
    render :index
  end
end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

def edit
  @book = Book.find(params[:id])

  if @book.errors.any?
    flash.now[:error] = "更新に失敗しました。エラーがあります。"
  else
    flash.now[:success] = "Book updated successfully."
  end
end

  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to @book, notice: 'Book was successfully updated.'
  else
    render :edit
  end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end