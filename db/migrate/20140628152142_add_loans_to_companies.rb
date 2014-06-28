class AddLoansToCompanies < ActiveRecord::Migration
  def change
    add_reference :loans, :company, index: true
  end
end
