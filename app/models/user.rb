class User < ActiveRecord::Base
  mount_uploader :profile_pic, ProfilePicUploader
end
