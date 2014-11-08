class User < ActiveRecord::Base
  mount_uploader :profile_pic, ProfilePicUploader

  has_many :comments
  has_many :created_posters, class_name: "Poster", foreign_key: :creator_id
  has_many :user_posters
  has_many :authored_posters, through: :user_posters, source: :poster

  validates :password, :last_name, :first_name, :email, presence: true
  validates :email, uniqueness: true

  #has_secure_password

  def disciplines
    tags_array = self.authored_posters.map {|poster| poster.tags}[0]
    tags_array.map {|tag| tag.discipline}.uniq
  end

  def name
    self.first_name + " " + self.last_name
  end
end
