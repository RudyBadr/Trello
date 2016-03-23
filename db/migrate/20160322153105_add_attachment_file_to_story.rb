class AddAttachmentFileToStory < ActiveRecord::Migration
  def self.up
    add_column :story_files, :file_file_name, :string
    add_column :story_files, :file_content_type, :string
    add_column :story_files, :file_file_size, :integer
    add_column :story_files, :file_updated_at, :datetime
  end

  def self.down
    remove_column :story_files, :file_updated_at
    remove_column :story_files, :file_file_name
    remove_column :story_files, :file_content_type
    remove_column :story_files, :file_file_size
  end
end
