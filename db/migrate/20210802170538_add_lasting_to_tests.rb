class AddLastingToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :lasting, :integer
  end
end
