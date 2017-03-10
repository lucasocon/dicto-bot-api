require 'cuba'
require './lib/client.rb'

Cuba.define do
  on get do
    on root do
      res.headers[Rack::CONTENT_TYPE] = 'application/json'
      res.status = 200

      res.write 'Hey bud!'
    end

    on 'find_term' do
      on param('text'), param('text') do |text|
        res.headers[Rack::CONTENT_TYPE] = 'application/json'
        res.status = 200

        res.write Client.call(text.strip).to_json
      end
    end
  end

  on post do
    on 'find_term' do
      on param('text') do |text|
        res.headers[Rack::CONTENT_TYPE] = 'application/json'
        res.status = 200

        res.write Client.call(text.strip).to_json
      end
    end
  end
end
