require 'httparty'
require 'json'

class WalkscoreAPI
  def self.config
    @@config = YAML.load_file(File.join(File.dirname(__FILE__), "../app/config.yml"))
  end

  def self.address_query_params(string)
    address = HackyAddress.new(string)

    {
      :wsapikey => self.config['walkscore_api_key'],
      :lat      => address.lat,
      :lon      => address.lng,
      :format   => :json
    }
  end

  def self.score(address_string)
    HTTParty.get("http://api.walkscore.com/score", :query => address_query_params(address_string).merge(:address => address_string))
  end

  def self.walk_shed(address_string)
    string = HTTParty.get("http://api.walkscore.com/walk_shed", :query => address_query_params(address_string))
    JSON.parse(string)
  end

  def self.stop_search(address_string)
    HTTParty.get("http://transit.walkscore.com/transit/search/stops/", :query => address_query_params(address_string))
  end
end
