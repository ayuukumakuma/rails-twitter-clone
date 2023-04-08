class ProfilesController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!
  def show
    @user = User.find_by(name: params[:name])
  end
end
