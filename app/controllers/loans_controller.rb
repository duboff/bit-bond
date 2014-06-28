class LoansController < ApplicationController

  before_filter :authenticate_user!

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.find(params[:id])
  end

  def create
    @loan = Loan.new params[:loan].permit(:amount, :term, :coupon)
    @loan.company = current_user.company
    if @loan.save
      redirect_to loan_path(@loan)
    else
      render 'new'
    end
  end

  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
  end
end
