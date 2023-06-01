class BooksController < ApplicationController
  
  def new
    # @book = Book.new #viewへ渡すためのインスタント変数
  end
  
  def create
    #データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params) 
    #データをデータベースに保存するためのsaveメソッド実行
    book.save
    #詳細画面へリダイレクト
    # redirect_to book_path(book.id)
  end
  
  def index
  end

  def show
  end

  def edit
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book) .permit(:title, :body)
  end
 
end

