class UsersController < ApplicationController

  def index
    @users = User.all.sort_by { |user| -user.monthly_profit }
  end
  
  def show   
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.all

    this_week = Date.today.all_week
    this_month = Date.today.all_month

    @day_profit = 0
    @week_profit = 0
    @month_profit = 0
    
    @posts.each do |post|
      if (post[:traded_at].to_s.match(/#{Date.today.to_s}.+/))
        @day_profit += post[:profit].to_i
      elsif (this_week.include?(Date.parse(post[:traded_at].to_s)))
        @week_profit += post[:profit].to_i
      elsif (this_month.include?(Date.parse(post[:traded_at].to_s)))
        @month_profit += post[:profit].to_i
      end 
    end

  end 

end
