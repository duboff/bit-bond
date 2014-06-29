class Loan < ActiveRecord::Base
  before_save :normalize_coupon, on: :create
  after_save :run_python, on: :create

  belongs_to :company

  def company_name=(company_name)
    comp = Company.find_or_create_by(name: company_name)
    comp.loans << self
  end
  def company_name
  end

  def normalize_coupon
    self.coupon = self.coupon / 100.0 if self.coupon > 1
  end

  def run_python
    value = %x(python ./lib/test.py)
    puts value
  end
end
