class Comment < ApplicationRecord
  mount_uploader :file, FileUploader
  
  belongs_to :user
  belongs_to :task
end
