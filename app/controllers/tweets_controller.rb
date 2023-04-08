class TweetsController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!

  def title
  end

  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = current_user.tweets.new
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def destroy
    current_user.tweets.find(params[:id]).destroy
    redirect_to timeline_path
  end

  def create
    current_user.tweets.create(tweet_params)
    redirect_to timeline_path
  end

  def update
    current_user.tweets.find(params[:id]).update(tweet_params)
    redirect_to timeline_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
