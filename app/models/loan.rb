class Loan < ActiveRecord::Base
  

  belongs_to :company

  def company_name=(company_name)
    comp = Company.find_or_create_by(name: company_name)
    comp.loans << self
  end
  def company_name
  end
end
