class SubwayStation
  attr_reader :name, :line, :coordinates

  @@all = []

  def initialize(name:, line:, coordinates:)
    @name = name
    @line = line
    @coordinates = coordinates
    @@all << self
    binding.pry
  end

  def self.all
    @@all 
  end

  def colorize_name
    color_match
  end

  def color_match
    color_matches = {"A" => :blue, "C" => :blue, "E" => :blue,
                     "1" => :red, "2" => :red, "3" => :red,
                     "N" => :light_yellow, "R" => :light_yellow, "Q" => :light_yellow,
                     "B" => :yellow, "D" => :yellow, "F" => :yellow, "M" => :yellow,
                     "4" => :green, "5" => :green, "6" => :green,
                     "G" => :light_green,
                     "L" => :light_black, "S" => :light_black,
                     "7" => :magenta,
                     "J" => {background: :yellow}, "Z" => {background: :yellow}}
    
    lines = self.line.gsub(" Express","").split("-")
    
    line_colors = lines.map do |line|
      color_matches[line]
    end.uniq
  end

end