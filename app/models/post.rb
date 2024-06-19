class Post < ApplicationRecord

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  
  # 取引日が存在することを検証
  validates :traded_at, presence: { message: "取引日は必須項目です" }
  
  # トレードが存在することを検証
  validates :trade, presence: { message: "トレードは必須項目です" }
  
  # 損益額が存在し、かつ数値であることを検証
  validates :profit, presence: { message: "損益額は必須項目です" },  numericality: { message: "損益額は数値でなければなりません" }

  # 株式銘柄が６文字以内であることを検証
  validates :stock_name, length: { maximum: 6, message: "は６文字以内で入力してください" }
end
