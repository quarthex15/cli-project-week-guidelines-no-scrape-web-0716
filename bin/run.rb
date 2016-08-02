require_relative '../config/environment'

SubwayAPICaller.new("https://data.cityofnewyork.us/resource/kk4q-3rt2.json").call
new_distances = Distances.new
binding.pry
#new_call = SubwayAPICaller.new("https://data.cityofnewyork.us/resource/kk4q-3rt2.json").call
