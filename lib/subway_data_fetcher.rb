require 'open-uri'

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

      if f.meta["content-type"] != "application/force-download" || f.status[0] != "200"
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
    end
  end

  def stop
    @running = false
  end
end
