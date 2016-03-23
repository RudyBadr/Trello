class CreateStoryFiles < ActiveRecord::Migration
  def change
    create_table :story_files do |t|
      t.string :file
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
