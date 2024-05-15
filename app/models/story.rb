class Story < ApplicationRecord
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true
    validates :description, presence: true
    validates :user_name, presence: true
  end
  