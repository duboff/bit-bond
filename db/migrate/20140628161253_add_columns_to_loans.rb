class AddColumnsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :subscribed, :float
  end
end
