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
    definition = response['list'].map { |result| result['definition'] }
    {
      "response_type": "in_channel",
      "text": "It's 80 degrees right now.",
      "attachments": [
          {
              "text":"Partly cloudy today and tomorrow"
          }
      ]
    }
  end
end
