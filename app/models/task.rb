class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :detail, length: { maximum: 500 }
  
  belongs_to :user

  has_many :comments, :dependent => :destroy
end
