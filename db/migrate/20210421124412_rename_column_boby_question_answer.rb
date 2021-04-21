class RenameColumnBobyQuestionAnswer < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :boby, :body
    rename_column :answers, :boby, :body
    rename_column :tests, :auhtor_id, :author_id
  end
end
