class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]
  
  def authorize
    authorize! :manage_post, @post
  end


  def index
    @post = Post.new
    @comment = Comment.new
    paginate = 10
    if params[:user_id]
      @posts = Post.where(:user_id => params[:user_id]).order('created_at DESC').paginate(:page => params[:page], :per_page => paginate)
    else
      @posts = Post.where(user_id: [current_user.id, current_user.friends.map(&:id)]).order('created_at DESC').paginate(:page => params[:page], :per_page => paginate)
    end
  end


  def show
  end


  def new
    @post = Post.new
  end


  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
        redirect_to posts_path, notice: 'Post was successfully added.'
    else
        redirect_to posts_path, alert: @post.errors.full_messages.first
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.' 
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit!
    end

end
