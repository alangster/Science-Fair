class Poster < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :user_posters
  has_many :users, through: :user_posters, source: :user
  has_many :poster_tags
  has_many :tags, through: :poster_tags, source: :tag

  validates :title, :abstract, :filepath, presence: true
end
