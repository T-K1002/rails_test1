class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)

      if @post.save
         flash[:notice]="新しい予定を作成しました"
         redirect_to posts_path
      else
         render :new
      end
  end

  def show
      @post = Post.find(params[:id])
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
         flash[:notice]="予定を編集しました"
         redirect_to posts_path 
      else 
         render :edit
      end
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy 
      flash[:notice]="予定を削除しました"
      redirect_to posts_path
end

  private

  def post_params
      params.require(:post).permit(:title,:content,:start_at,:end_at,:all_day)
  end

end
