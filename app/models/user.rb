class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :password, length: { minimum: 6 }
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("pf-default.jpeg")
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/gif", "image/png"] }

  has_many :projects
  has_many :project_members
  has_many :projects_joined, :class_name => "Project", :foreign_key => "project_id" ,through: :project_members , source: :project
end
