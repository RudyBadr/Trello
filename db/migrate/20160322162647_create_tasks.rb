class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :state , :default => "not done"
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
