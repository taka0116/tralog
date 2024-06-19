class UsersController < ApplicationController

  def index
    @users = User.all.sort_by { |user| -user.monthly_profit }
  end


  def show
    @user = User.find(params[:id])
    @today_profit = @user.posts.where(traded_at: Time.zone.today.all_day).sum(:profit)
    @week_profit = @user.posts.where(traded_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).sum(:profit)
    @month_profit = @user.posts.where(traded_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).sum(:profit)
    @year_profit = @user.posts.where(traded_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year).sum(:profit)
  end

end
