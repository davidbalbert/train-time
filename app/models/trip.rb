class Trip < ActiveRecord::Base
  attr_accessible :identifier, :route, :next_stop, :arrival_time
end
