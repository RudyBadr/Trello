class Task < ActiveRecord::Base
  belongs_to :story
  validates :name , presence: true
  validates_uniqueness_of :name, scope: :story_id
end
