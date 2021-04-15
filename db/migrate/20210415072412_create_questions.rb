class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :boby,       null: false
      t.references :test,   foreign_key: true

      t.timestamps
    end
  end
end
