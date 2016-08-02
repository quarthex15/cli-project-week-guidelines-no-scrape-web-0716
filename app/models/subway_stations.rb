class SubwayStation
  attr_reader :name, :line, :coordinates

  @@all = []

  def initialize(name:, line:, coordinates:)
    @name = name
    @line = line
    @coordinates = coordinates
    @@all << self
  end

  def self.all
    @@all 
  end

end