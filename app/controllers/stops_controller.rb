class StopsController < ApplicationController
  def show
    @from = params[:from]
    stop_ids = params[:id]

    stops = []
    stop_ids.split(",").each do |stop_id|
      @stop = get_stop(stop_id)
      stops << @stop
    end

    respond_to do |format|
      format.html # show
      format.json { render json: (stops.length == 1 ? @stop : stops) }
    end
  end

  private
  def get_stop(id)
    {
      id: id,
      name: get_stop_name(id),
      lines: get_lines(id),
      uptown: [{line: 3, time: 3, destination: "Harlem - 148 St"},
                 {line: 2, time: 7, destination: "Wakefield - 241 St"},
                 {line: 3, time: 13, destination: "Harlem - 148 St"}],
      downtown: [{line: 3, time: 0, destination:  "New Lots Av"},
                   {line: 2, time: 8, destination: "Flatbush Av"},
                   {line: 3, time: 15, destination: "New Lots Av"}]
    }
  end
end
