class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table :project_members do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end