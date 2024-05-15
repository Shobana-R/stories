class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :child_comments, class_name: 'Comment', foreign_key: 'parent_comment_id', dependent: :destroy
  
  validates :content, presence: true
  validates :user_name, presence: true
end
