class FriendshipsController < ApplicationController

  def friend_request
    user = User.find(params[:id])
    @reciever_path = user_path(user.id)
    @reciever = user
    @author = current_user
    friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id] , status: :false).first_or_create
  end

  def friend_request_accept
    user = User.find(params[:id])
    @reciever_path = user_path(user.id)
    @reciever = user
    @author = current_user
    user = User.find(params[:id])
    friendship = Friendship.where(user_id: params[:id], friend_id: current_user.id ).first
    friendship.update_attributes(status: :accepted)
    friendship = Friendship.create(user_id: current_user.id, friend_id: params[:id], status: :accepted)
  end

  def friend_request_reject
    user = User.find(params[:id])
    @reciever_path = user_path(user.id)
    @reciever = user
    @author = current_user
    friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]])
    friendship.destroy_all
  end

end
