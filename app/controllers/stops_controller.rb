class StopsController < ApplicationController
  def show
    @from = params[:from]
    stop_id = params[:id]
    @stop_name = get_stop_name(stop_id)
    @lines = get_lines(stop_id)

    respond_to do |format|
      format.html # show
      format.json do
        render json: {
          name: @stop_name,
          lines: @lines,
          uptown: [{line: 3, time: 3, destination: "Harlem - 148 St"},
                   {line: 2, time: 7, destination: "Wakefield - 241 St"},
                   {line: 3, time: 13, destination: "Harlem - 148 St"}],
          downtown: [{line: 3, time: 0, destination:  "New Lots Av"},
                     {line: 2, time: 8, destination: "Flatbush Av"},
                     {line: 3, time: 15, destination: "New Lots Av"}]
        }
      end
    end
  end
end
