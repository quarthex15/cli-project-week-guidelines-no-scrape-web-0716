class SubwayCLI
  attr_accessor :new_user

  def call
    puts "Welcome, what is your name?"
    @new_user = User.new(get_user_input)
    puts "Hi, #{@new_user.name}! Here is the help documentation:"
    help
    run
  end
    
  def get_user_input
    gets.chomp.strip
  end

  def run
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    print "Please enter your address:"
    run
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Otherwise, enter your address to search for your closest subway stations."
  end

  def search(input)
    # if /-?\d{2}\.\d{5}\d*, -?\d{2}\.\d{5}\d*/ =~ input
    #   coordinates = input.split(", ")

    #   new_user.coordinates = coordinates.collect {|coordinate| coordinate.to_f}
    #   puts "Your coordinates are #{new_user.coordinates[0]}, #{new_user.coordinates[1]}, I am searching for the closest subway stations..."

    #   new_distances = Distances.new(self.new_user)

    #   new_distances.sorted_hashes[0...5].each do |distance_hash|
    #     puts "#{distance_hash[:station].name}: #{distance_hash[:distance].to_i}m"
    #   end
    # else
    #   puts "Please enter valid coordinates (XX.XXXXXX, YY.YYYYYY)"
    # end

    # 
    # 

    geocoder_search = Geocoder.search(input)
    lat = (geocoder_search[0].data["geometry"]["viewport"]["northeast"]["lat"] + geocoder_search[0].data["geometry"]["viewport"]["southwest"]["lat"])/2
    lng = (geocoder_search[0].data["geometry"]["viewport"]["northeast"]["lng"] + geocoder_search[0].data["geometry"]["viewport"]["southwest"]["lng"])/2

    new_user.coordinates = [lng, lat]

    puts "Your coordinates are #{new_user.coordinates[0]}, #{new_user.coordinates[1]}, I am searching for the closest subway stations..."

    new_distances = Distances.new(self.new_user)

    new_distances.sorted_hashes[0...5].each do |distance_hash|
      puts "#{distance_hash[:station].name}: #{distance_hash[:distance].to_i}m"
    end
  end


end

