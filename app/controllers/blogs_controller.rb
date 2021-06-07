class BlogsController < ApplicationController
# before_actionメソッド、テキストrails 入門27に記載
  before_action :set_blog, only: [:show, :edit, :update,:destroy]
  def index
    @blogs = Blog.all

  end
  def new
    @blog = Blog.new
  end
  def create
    @blog =Blog.new(blog_params)
  if params[:back]
      render :new
  else
    if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。

      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
   end
  end

  def show
    # 追記する
    # @blog = Blog.find(params[:id])重複
  end

  def edit
    # @blog = Blog.find(params[:id])重複
  end

  def update
    # @blog = Blog.find(params[:id])
    # 重複個所はメゾットを作りprivate句の中に記載
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
     @blog.destroy
      redirect_to blogs_path, notice:"ブログを削除しました！"
   end
   def confirm
   @blog = Blog.new(blog_params)
     render :new if @blog.invalid?
    end

  private
  def blog_params
    params.require(:blog).permit(:title,:content)
  end
# 下は重複箇所のメゾット
  def set_blog
     @blog = Blog.find(params[:id])
   end
end
