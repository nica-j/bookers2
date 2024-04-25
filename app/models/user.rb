class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #画像を持つための宣言      
  has_one_attached :image
  
  has_many :books, dependent: :destroy
  
  validates :name, uniqueness: true
  validates :name,  length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  
  def profile_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end 
end
