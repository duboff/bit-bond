class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :amount
      t.integer :term
      t.float :coupon

      t.timestamps
    end
  end
end
