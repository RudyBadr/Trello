class MemberStory < ActiveRecord::Base
  belongs_to :project_member
  belongs_to :story
end
