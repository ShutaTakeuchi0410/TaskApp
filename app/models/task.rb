class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :detail, length: { maximum: 500 }
  
  belongs_to :user
  # project_id変更時のnilを許可する
  belongs_to :project, optional: true

  has_many :comments, :dependent => :destroy
  has_many :task_tags, :dependent => :destroy
  has_many :tags, through: :task_tags

  before_create do
    run_xxxxxxxxxx
  end

  after_update :run_xxxxxxxxxxxxxx
end