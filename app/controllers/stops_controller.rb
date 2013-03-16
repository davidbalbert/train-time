class StopsController < ApplicationController
  def show
    @from = params[:from]
    stop_id = params[:id]
    @stop_name = get_stop_name(stop_id)
    @lines = get_lines(stop_id)
  end
end
