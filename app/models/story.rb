class Story < ActiveRecord::Base
  belongs_to :project
  has_many :story_files
  has_many :tasks
  has_many :member_stories
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :project_id
end
