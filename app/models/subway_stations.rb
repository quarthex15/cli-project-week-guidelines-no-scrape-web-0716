class SubwayStation
  attr_reader :name, :line, :coordinates

  @@all = []

  def initialize(name:, line:, coordinates:)
    @line = line
    @name = colorize_name(name)
    @coordinates = coordinates
    @@all << self
  end

  def self.all
    @@all 
  end

  def colorize_name(name)
    color_array = color_match
    n = name.length/color_array.length
    if color_array.size == 1
      name = name.colorize(color_array[0])
    elsif color_array.size == 2
      name1 = name[0..(n-1)].colorize(color_array[0])
      name2 = name[n..(name.length-1)].colorize(color_array[1])
      name = [name1,name2].join("")
    else
      name1 = name[0..(n-1)].colorize(color_array[0])
      name2 = name[n..(2*n-1)].colorize(color_array[1])
      name3 = name[2*n..(name.length-1)].colorize(color_array[2])
      name = [name1,name2,name3].join("")
    end
    name
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