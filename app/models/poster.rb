class Poster < ActiveRecord::Base
  
  mount_uploader :filepath, ProfilePicUploader

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :comments, as: :commentable
  has_many :user_posters
  has_many :users, through: :user_posters, source: :user
  has_many :poster_tags
  has_many :tags, through: :poster_tags, source: :tag

  # validates :title, :abstract, :filepath, :creator_id, presence: true
  validates :title, :abstract, :creator_id, presence: true


  def author_emails
  	emails(self.user_posters)
  end

  def credit_where_it_is_due(params)
    filter_emails(params).each do |key, value|
      if value != "" && user = User.find_by(email: value)
        UserPoster.create!(poster: self, user: user)
      end
    end
  end

  def update_credit(params)
  	email_array = emails(get_ups)
  	filter_emails(params).each do |key, value|
  		if !email_array.include?(value) && user = User.find_by(email: value)
  			UserPoster.create!(poster: self, user: user)
  		end
  	end
  end

  private 

  def get_ups
 		self.user_posters
  end

  def emails(ups)
  	ups.map do |u_p|
  		u_p.user.email
  	end
  end

  def filter_emails(params)
	  params.select do |key|
	    /email\d/.match(key)
	  end
  end

end
