class Poster < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  mount_uploader :filepath, ProfilePicUploader
  has_many :comments, as: :commentable
  has_many :user_posters
  has_many :users, through: :user_posters, source: :user
  # accepts_nested_attributes_for :users
  has_many :poster_tags
  has_many :tags, through: :poster_tags, source: :tag

  validates :title, :abstract, :filepath, presence: true


end
