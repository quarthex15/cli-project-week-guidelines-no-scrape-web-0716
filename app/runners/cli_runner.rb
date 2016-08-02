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
      binding.pry
    end
    print "Enter new coordinates:"
    run
  end

  def search(input)
    coordinates = input.split(", ")

    new_user.coordinates = coordinates.collect {|coordinate| coordinate.to_f}
    puts "Your coordinates are #{new_user.coordinates[0]}, #{new_user.coordinates[1]}, I am searching for the closest subway stations..."

    SubwayAPICaller.new("https://data.cityofnewyork.us/resource/kk4q-3rt2.json").call
    new_distances = Distances.new(self.new_user)

    new_distances.sorted_hashes[0...5].each do |distance_hash|
      puts "#{distance_hash[:station].name}: #{distance_hash[:distance].to_i}m"
    end

    # url = "https://twitter.com/search?q=#{search_term}&src=typd&f=realtime"
    # tweet = ExampleScraper.new(url).example_method.sample
    # puts "Thank you for your patience. I found this on Twitter:"
    # puts tweet.example
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Otherwise, enter your coordinates to search for your closest subway stations."
  end

end

