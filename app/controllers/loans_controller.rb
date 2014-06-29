class LoansController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new params[:loan].permit(:amount, :term, :coupon, :company_name)
    if @loan.save
      render "loans/show"
    else
      render 'new'
    end
  end

  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find params[:id] 
  end
end