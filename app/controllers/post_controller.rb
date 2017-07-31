class PostController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
    @Post = Post.find(params[:id])
  end

  def new
    @Post = Post.new
  end

  def create
    @Post = Post.new(post_params)

    if @Post.save
      redirect_to :action => Post.all
    else
      @comments = Comment.all
      render :action => 'new'
  end

end
