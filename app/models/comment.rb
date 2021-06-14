class Comment < ApplicationRecord
  mount_uploader :file, FileUploader

  validates :content, presence: true
  validates :content, length: { maximum: 255 }

  belongs_to :user
  belongs_to :task
end
