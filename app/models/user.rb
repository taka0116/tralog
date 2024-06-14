class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { maximum: 50 }

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def monthly_profit
    start_of_month = Time.now.beginning_of_month
    end_of_month = Time.now.end_of_month
    posts.where(created_at: start_of_month..end_of_month).sum(:profit)
  end

end
