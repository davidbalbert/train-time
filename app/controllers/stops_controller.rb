class StopsController < ApplicationController
  def show
    @from = params[:from]
  end
end
