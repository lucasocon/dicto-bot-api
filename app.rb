require 'cuba'
require './lib/client.rb'

Cuba.define do
  on get do
    on root do
      res.write 'Hey bud!'
    end
  end

  on post do
    on 'find_term.json', param('term') do |term|
      res.write Client.call(term.strip)
    end
  end
end
