class ProjectMember < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :member_stories
  validates_uniqueness_of :user_id, scope: :project_id
end
