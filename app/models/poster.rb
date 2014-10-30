class Poster < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :comments, as: :commentable
  has_many :user_posters
  has_many :creators, through: :user_posters, source: :user
  has_many :poster_tags
  has_many :tags, through: :poster_tags, source: :tag

  validates :title, :abstract, :filepath, presence: true
end
