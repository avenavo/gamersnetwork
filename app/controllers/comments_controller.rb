class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]
  
  def authorize
    authorize! :manage_comments, @comment
  end

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    if @post.present?
      @comment = current_user.comments.new(:comment => params[:comment]['comment'], :post_id => params[:post_id])
      if @comment.save
        @reciever_path = user_path(@post.user)
        @author = current_user
      else
        redirect_to posts_path, alert: @comment.errors.full_messages.first
      end
    else
      redirect_to posts_path, alert: "Post does not exist."
    end
  end

  def update
  end

  def destroy
    @post = @comment.post
    @comment.destroy
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

 
    def comment_params
       params.require(:comment).permit!
    end


end
