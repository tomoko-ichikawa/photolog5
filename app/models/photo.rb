class Photo < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    has_many :comments, dependent: :destroy
    
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
