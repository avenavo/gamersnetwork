class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    paginate=50
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => paginate)
    else
      @users = User.all.order('created_at DESC').paginate(:page => params[:page], :per_page => paginate)
    end
  end

  def friends_index
   paginate=50
    if params[:search]
      @users = current_user.friends.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => paginate)
    else
      @users = current_user.friends.all.order('created_at DESC').paginate(:page => params[:page], :per_page => paginate)
    end
  end
end
