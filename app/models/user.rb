class User < ActiveRecord::Base
  mount_uploader :profile_pic, ProfilePicUploader

  has_many :comments
  has_many :created_posters, class_name: "Poster", foreign_key: :user_id
  has_many :user_posters
  has_many :authored_posters, through: :user_posters, source: :poster

  validates :password_hash, :last_name, :first_name, :email, presence: true

  validates :email, uniqueness: true, message: "An account with that email already exists."


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
