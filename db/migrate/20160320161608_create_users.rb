class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullName
      t.string :username
      t.string :password_digest
      t.string :initials
      t.text :bio
      t.text :image

      t.timestamps null: false
    end
  end
end
