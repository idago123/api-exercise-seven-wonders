require 'httparty'
require 'awesome_print'
KEY = "fcb38182c218bf"
US_URL = "https://us1.locationiq.com/v1/search.php?"
seven_wonders = ["Great Pyramid of Giza",
                 "Gardens of Babylon",
                 "Colossus of Rhodes",
                 "Pharos of Alexandria",
                 "Statue of Zeus at Olympia",
                 "Temple of Artemis",
                 "Mausoleum at Halicarnassus"]

seven_wonders_hash = {}
seven_wonders.each do |wonder|
response = HTTParty.get(US_URL, query: {
    q: wonder,
    key: KEY,
    format: 'json'
}
)

if response.code == 200
  seven_wonders_hash[wonder] = {
      "lat" => response.first["lat"],
      "lon" => response.first["lon"]
}
  end
end
ap seven_wonders_hash
# pp response.first["lat"]
# puts "Latitude: #{response.first["lat"]}"
# puts "longitude: #{response.first["lon"]}"
#pp response.first