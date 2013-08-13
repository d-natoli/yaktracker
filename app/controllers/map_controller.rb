class MapController < ApplicationController
  def index
    polylines = build_route

    markers = Guess.paid.to_gmaps4rails do |guess, marker|
      marker.infowindow render_to_string(:partial => "/guesses/message", :locals => { :guess => guess })
    end

    #add the checkin markers to the guess markers
    markers = "#{markers[0..-2]}, #{CheckIn.all.to_gmaps4rails[1..-1]}"

    @map_options = { "map_options" => { "container_class" => "main_map map_container", 
                                        "provider_key" => ENV["GOOGLE_MAPS_KEY"] },
                     "direction" => { "data" => { "from" => Checkpoint.first,
                                                  "to" => Checkpoint.last },
                                      "options" => { "waypoints" => Checkpoint.all[1...-1] }
                                    },
                     "polylines" => { "data" => polylines },
                     "markers" => { "data" => markers }
    }
  end

  private
  def tweets
    Rails.cache.fetch('tweets', :expires_in => 60.minutes) do
      Twitter.user_timeline("yaktracker", :count => 200)
    end
  end

  def build_route
    Rails.cache.fetch('route', :expires_in => 60.minutes) do
      build_twitter_markers
      build_route_string
    end
  end

  def build_route_string
    route = "["

    locations = CheckIn.all.map(&:location)

    while locations.size > 0 do
      points = locations.slice!(0,8)
      waypoints = points.count > 2 ? points[1..-2] : []
      result = Gmaps4rails.destination({ "from" => points[0], "to" => points[-1]}, "waypoints" => waypoints)
      route << result.map { |leg| leg["polylines"] }.join(",")
      route << ","
      locations.unshift(points[-1]) if locations.size > 0
    end

    route.chomp ','
    route << "]"
  end

  def build_twitter_markers
    if tweets.count != CheckIn.count
      tweets.reverse.map do |tweet|
        location = tweet.text.partition("-")[0].strip
        message = tweet.text.partition("-")[2].strip
        location.gsub!(/Balquash/,"Balqash")
        CheckIn.create!(:location => location, :message => message) unless CheckIn.find_by_location(location)
      end
    end
  end
end
