class StopsController < ApplicationController
  def show
    @from = params[:from]
    @favorited = true
  end
end
