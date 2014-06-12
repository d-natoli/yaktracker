class CheckIn < ActiveRecord::Base
  acts_as_gmappable

  validates :location, presence: true

  def gmaps4rails_address
    location
  end

  def gmaps4rails_infowindow
    "<h1>#{location}</h1><p>#{message}</p>"
  end

  def gmaps4rails_marker_picture
    {
      "picture" => "assets/greenmarker.png",
      "width" => 27,
      "height" => 40,
      "marker_anchor" => [ 10, 30]
    }
  end
end
