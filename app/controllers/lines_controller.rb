class LinesController < ApplicationController
  def show
    @line_num = params['id']
    @stops = STOPS_BY_LINE[@line_num]
  end
end
