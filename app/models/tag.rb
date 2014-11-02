class Tag < ActiveRecord::Base
  has_many :poster_tags
  has_many :posters, through: :poster_tags, source: :poster
end
