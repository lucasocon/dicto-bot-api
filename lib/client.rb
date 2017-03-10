require 'httparty'

class Client
  BASE_URL = 'http://api.urbandictionary.com/v0/define?'.freeze

  class << self
    def call(term)
      new.(term)
    end
  end

  def call(term)
    response = HTTParty.get("#{BASE_URL}term=#{term}")
    response['list'].map { |result| result['definition'] }
  end
end
