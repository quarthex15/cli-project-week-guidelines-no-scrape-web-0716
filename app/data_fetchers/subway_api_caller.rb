require 'rest-client'
require 'json'

class SubwayAPICaller

  attr_reader :url, :subway_data

  # example url:
  # "https://data.cityofnewyork.us/resource/kk4q-3rt2.json"
  
  def initialize(url)
    @url = url
    @all_subways = RestClient.get(@url)
    @subway_data = JSON.parse(@all_subways)
  end

  #want name, line, coordinates
  def call
    self.subway_data.collect do |subway_station|
      station = SubwayStation.new(name: subway_station["name"], line: subway_station["line"], coordinates: subway_station["the_geom"]["coordinates"])
    end
  end

end
