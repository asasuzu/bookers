class BooksController < ApplicationController

  def new
   
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成 
    @book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      #フラッシュメッセージを定義
      flash[:notice] = "Book was successfully created."
      #詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.order("id")
      render :index
    end
  end

  def index
    @books = Book.order("id")
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book =Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book) .permit(:title, :body)
  end

end

