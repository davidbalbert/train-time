require 'subway_data_fetcher'

namespace :subway do
  desc "Fetch MTA realtime subway data every 30 seconds"
  task :fetch do
    SubwayDataFetcher.new(ENV["MTA_API_KEY"]).start
  end

  desc "Generate ruby files from GTFS protobuf files"
  task :generate => ["require_protoc", "nyct-subway.pb.rb", "gtfs-realtime.pb.rb"]

  task "require_protoc" do
    unless system "which protoc >/dev/null"
      $stderr.puts "Error: You need protoc - the protoc buffer compiler"
      $stderr.puts "You can install it by running `brew install protobuf`"
      exit 1
    end
  end

  file "nyct-subway.pb.rb" => ["lib/nyct-subway.proto"] do
    system "ruby-protoc -Ilib lib/nyct-subway.proto"
  end

  file "gtfs-realtime.pb.rb" => ["lib/gtfs-realtime.proto"] do
    system "ruby-protoc -Ilib lib/gtfs-realtime.proto"
  end
end
