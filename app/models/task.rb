class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :detail, length: { maximum: 500 }
  
  belongs_to :user
  # project_id変更時のnilを許可する
  belongs_to :project, optional: true

  has_many :comments, :dependent => :destroy
end