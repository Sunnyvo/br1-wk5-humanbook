class FriendshipsController < ApplicationController
  def create
    current_user.add_friend(User.find_by(id: params[:another_user_id]))
    flash[:success] = "Add success"
  end

  def destroy
    current_user.remove_friend(User.find_by(id: params[:another_user_id]))
    
  end
end
