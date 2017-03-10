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
    definitions = response['list'].map { |result| result['definition'] }
    text = ''
    definitions.each { |definition| text << "#{definition} \n\n" }
    json_response text
  end

  private

  def json_response(text)
    {
      response_type: 'in_channel',
      text: "That's we found...",
      attachments: [
        {
          text: text,
          color: '#36a64f',
					thumb_url: 'http://i0.kym-cdn.com/entries/icons/original/000/016/956/10042483-funny-robot-sit-with-headphones.jpg'
        }
      ]
    }
  end
end
