class Poster < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  mount_uploader :filepath, ProfilePicUploader
  mount_uploader :audio_path, ProfilePicUploader
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

  def credit_where_it_is_due(emails)
    emails.each { |email| User.find_by(email:email).authored_posters << self }
  end

  def update_credit(updated_emails)
    # self.authors = updated_emails.map {|email| User.find_or_create_by(email:email)} #does AR update the join records?

  	email_array = emails(get_ups)
  	filter_emails(params).each do |key, value|
  		if !email_array.include?(value) && user = User.find_by(email: value)
  			UserPoster.create!(poster: self, user: user)
  		end
  	end
  end

  def self.filter_sort(filter_option, sort_option)
    #filter
    if filter_option == 'All disciplines'
      processed_posters = Poster.all
    else
      processed_posters = Posters.all.where(tags:{discipline:filter_options})
      # processed_posters = Tag.where(discipline: filter_option)[0].posters
    end
    #sort
    case sort_option
    when "Most recent"
      # processed_posters.sort_by(:created_at)
      processed_posters.sort{|poster1, poster2| poster2.created_at <=> poster1.created_at}
    when "Upvote points"
      processed_posters.sort{|poster1, poster2| poster2.points <=> poster1.points}
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

  def self.custom_filter(filter_option)
    if filter_option = 'All disciplines'
      Tag.all
    else
      Tag.where(discipline: filter_option).posters
    end
  end

  def custom_sort(sort_option)
    case sort_option
    when "Most recent"
      self.order('created_at DESC')
    when "Upvote points"
      self.order('points DESC')
    end
  end
end
