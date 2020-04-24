class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy

  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
