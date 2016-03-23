class CreateMemberStories < ActiveRecord::Migration
  def change
    create_table :member_stories do |t|
      t.references :project_member, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
