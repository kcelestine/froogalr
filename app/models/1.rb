module Factual
  FACTUAL_KEY = ENV["FACTUAL_API_KEY"]


  # Get info from Factual
  def self.restaurant_info(zip)
    url = URI.escape("http://api.v3.factual.com/t/restaurants-us?filters={\"price\":\"1\",\"postcode\":\"#{zip}\"}&KEY=#{FACTUAL_KEY}&limit=1")
    response = HTTParty.get(url)['response']['data']
  end

end
