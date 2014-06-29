class VisitorsController < ApplicationController
  def index
    redirect_to loans_path if user_signed_in?
  end
end
