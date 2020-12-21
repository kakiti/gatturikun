class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :last_name,       null: false
      t.string :first_name,      null: false
      t.string :last_name_kana,  null: false
      t.string :first_name_kana, null: false
      t.string :tel_number,      null: false
      t.integer :prospect_id,    null: false
      t.date :date,              null: false
      t.text :memo
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
