class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.string :title
      t.text :description

      t.timestamps null: false
      t.belongs_to :user, index: true
    end
  end
end
