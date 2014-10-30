class UserPoster < ActiveRecord::Base
  belongs_to :poster
  belongs_to :user
end
