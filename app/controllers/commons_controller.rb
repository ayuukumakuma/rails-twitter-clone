class CommonsController < ApplicationController
  before_action :authenticate_user!

  def search
    # 検索フォームから送られてきたパラメータを含むユーザーを取得
    @users = User.where('name LIKE(?)', "%#{params[:name]}%")
  end
end
