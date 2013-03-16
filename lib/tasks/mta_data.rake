require 'subway_data_fetcher'

namespace :subway do
  desc "Fetch MTA realtime subway data every 30 seconds"
  task :fetch do
    SubwayDataFetcher.new(ENV["MTA_API_KEY"]).start
  end
end
