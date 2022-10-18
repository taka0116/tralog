class Post < ApplicationRecord

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  validates :stock_name, length: { maximum: 6, message: "は６文字以内で入力してください" }
end
