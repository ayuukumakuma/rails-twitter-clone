class TweetsController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!

  def index
    # 自分とフォローしているユーザーのツイートを取得
    # *current_user.following_idsは配列を展開してくれる
    @tweets = Tweet.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
  end

  def new
    @tweet = current_user.tweets.new
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def destroy
    current_user.tweets.find(params[:id]).destroy
    redirect_to home_path
  end

  def create
    current_user.tweets.create(tweet_params)
    redirect_to home_path
  end

  def update
    current_user.tweets.find(params[:id]).update(tweet_params)
    redirect_to home_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
