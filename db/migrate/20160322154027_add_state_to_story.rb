class AddStateToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :state, :string, :default => "open"
  end

  def self.down
    remove_column :stories, :state
  end
end
