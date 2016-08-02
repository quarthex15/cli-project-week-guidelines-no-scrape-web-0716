class SubwayStation
  attr_reader :name, :line, :coordinates

  def initialize(name:, line:, coordinates:)
    @name = name
    @line = line
    @coordinates = coordinates
  end

end