class StoryFile < ActiveRecord::Base
  belongs_to :story
  has_attached_file :file,
    :path => ":rails_root/public/story_files/:id/:filename",
    :url  => "/story_files/:id/:filename"
  validates_attachment :file, content_type: { content_type: ["application/pdf", "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.wordprocessingml.document","image/jpg", "image/gif", "image/png"] }
end
