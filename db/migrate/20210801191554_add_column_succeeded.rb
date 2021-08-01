class AddColumnSucceeded < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :succeeded, :boolean, default: false
  end
end
