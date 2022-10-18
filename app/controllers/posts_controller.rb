class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i(destroy edit update)

  def new
    @post = Post.new
    @post.photos.build
  end  

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      render "new"
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.includes(:photos, :user).order('created_at DESC').page(params[:page]).per(10)
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
      flash[:alert] = "投稿が編集されました"
    else
      render "edit"
      flash[:alert] = "投稿の編集に失敗しました"
    end
  end

  private
    def post_params
      params.require(:post).permit(:traded_at, :trade, :stock_code, :stock_name, :currency, :stock_index, :profit, :memo, photos_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end

end
