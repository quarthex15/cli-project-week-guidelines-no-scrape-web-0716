require_relative '../config/environment'

SubwayAPICaller.new("https://data.cityofnewyork.us/resource/kk4q-3rt2.json").call
SubwayCLI.new.call
