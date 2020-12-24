class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.boolean :check
      t.text :content,     null: false
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
