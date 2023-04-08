class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    # current_userでbuildしてるからすでにfollowing_idが入ってる
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_to home_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to home_path
  end
end
