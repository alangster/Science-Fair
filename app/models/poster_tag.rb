class PosterTag < ActiveRecord::Base
  belongs_to :poster
  belongs_to :tag
end
