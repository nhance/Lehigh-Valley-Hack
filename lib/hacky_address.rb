require 'geokit'

class HackyAddress
  def initialize(address_string)
    @geocoded_address = Geokit::Geocoders::GoogleGeocoder.geocode address_string
  end

  def method_missing(name, *args, &block)
    @geocoded_address.send(name, *args, &block)
  end
end
