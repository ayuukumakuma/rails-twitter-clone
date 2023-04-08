class ProfilesController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!
  def index
  end
end
