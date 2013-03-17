require 'open-uri'

require 'nyct-subway.pb'

class SubwayDataFetcher
  class ApiException < StandardError; end

  def initialize(api_key)
    unless api_key
      raise ApiException, 'ENV["MTA_API_KEY"] must be set.'
    end

    @endpoint = "http://datamine.mta.info/mta_esi.php?key=#{api_key}"
    @running = false
  end

  def start
    @running = true
    puts "SubwayDataFetcher: starting"

    trap ("TERM") do
      puts "Exiting..."
      stop
    end

    trap ("INT") do
      puts "Exiting..."
      stop
    end

    while @running do
      fetch

      30.times do
        sleep 1
        break unless @running
      end
    end
  end

  def fetch
    puts "Fetching..."
    open(@endpoint) do |f|
      body = f.read

      if f.status[0] != "200" || f.meta["content-type"] != "application/force-download"
        puts "Looks like we got a bad response. Perhaps you're using a bad API key?"
        puts "Trying again in 30 seconds"
        puts
        puts "Response info for debugging:"

        p f.status
        p f.meta
        p body

        break
      end

      puts "#{body.size} bytes read"

      data = TransitRealtime::FeedMessage.parse(body)

      trip_updates = data.entity.select { |e| e.has_trip_update? }.map(&:trip_update)
      trip_updates.each do |tu|
        trip = Trip.where(identifier: tu.trip.trip_id).
          first_or_create(route: tu.trip.route_id)

        trip.next_stop = tu.stop_time_update[0].stop_id
        trip.arrival_time = Time.at(tu.stop_time_update[0].arrival.time)

        trip.save
      end

      Trip.where('identifier NOT IN (?)', trip_updates.map { |tu| tu.trip.trip_id }).each do |t|
        t.destroy
      end
    end
  end

  def stop
    @running = false
  end
end
