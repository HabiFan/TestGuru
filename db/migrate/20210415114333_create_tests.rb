class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title,          null: false
      t.integer :level,         defaut: 0
      t.references :category,   null: false,  foreign_key: true
      t.references :auhtor,     null: false,  foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end