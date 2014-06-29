class LoansController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new params[:loan].permit(:amount, :term, :coupon, :company_name)
    if @loan.save
      render '/loans'
    else
      render 'new'
    end
  end

  def index
    @loans = Loan.all
    @subscribed = (0..@loans.size).map { |a| (50..75).to_a.sample / 100.0}
  end

  def show
    @loan = Loan.find params[:id]
    @subscribed = (50..75).to_a.sample
  end
end