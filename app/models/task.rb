class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 100 } #100文字までの制限
  
  belongs_to :user
end
