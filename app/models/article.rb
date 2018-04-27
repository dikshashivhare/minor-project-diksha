class Article < ApplicationRecord
   mount_uploader :cover_image, ProfilePicUploader
end
