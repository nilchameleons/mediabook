class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :username, presence: true, uniqueness: true

         has_many :friendships, dependent: :destroy
         has_many :inverse_friendships, class_name: "Friendship", foreign_key: friend_id, dependent: :destroy
end
