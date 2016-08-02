require 'pry'
class Distances

  attr_reader :user, :subways_with_distances, :sorted_hashes

  def initialize(user)
    #user.location will = coordinates
    @user = user
    @subways_with_distances = gather_distances
    @sorted_hashes = sort_by_distance(@subways_with_distances)
    binding.pry
  end

  # user.location => coordinates of user as an array of 2 elements
  # @subway_data => array of subway objects, each of which includes coordinates

  def calculate_distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

  def gather_distances
    @subway_data = SubwayStation.all
    @subway_data.collect do |subway|
      distance = calculate_distance(subway.coordinates, self.user.coordinates)
      {station: subway, distance: distance}
    end
  end

  def sort_by_distance(subways_distances_array)
    subways_distances_array.sort_by do |subway_and_distance|
      subway_and_distance[:distance]
    end
  end

end

class User
  attr_accessor :coordinates

  def initialize
    @coordinates = [-73.9752089996586,40.680699332136946]
  end
end