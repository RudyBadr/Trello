class Project < ActiveRecord::Base
	belongs_to :user
	has_many :project_members
	has_many :users, through: :project_members
	validates :title, presence: true
end
