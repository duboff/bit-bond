class AddLoansToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :company, index: true
  end
end
