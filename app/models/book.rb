class Book < ApplicationRecord
  #画像を持つための宣言 
  has_one_attached :image
  
  belongs_to :user
end
