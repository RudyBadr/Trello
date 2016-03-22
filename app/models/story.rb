class Story < ActiveRecord::Base
  belongs_to :project
  has_many :story_files
  has_many :tasks
  validates :name, presence: true
end
