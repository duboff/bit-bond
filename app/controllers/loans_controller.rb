class LoansController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new params[:loan].permit(:amount, :term, :coupon, :company_name)
    @loan.subscribed = 0
    if @loan.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    @loan = Loan.find params[:id]
    @loan.subscribed += 20 if @loan.subscribed < 100
    @loan.save!
    redirect_to loan_path(@loan)
  end

  def index
    @loans = Loan.all
    @subscribed = (0..@loans.size).map { |a| 0}
  end

  def show
    @loan = Loan.find params[:id]
    @subscribed = (50..75).to_a.sample
  end
end