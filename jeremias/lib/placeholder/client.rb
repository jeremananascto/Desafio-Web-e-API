require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http

module Placeholder
  class Client
    URL = 'https://jsonplaceholder.typicode.com'.freeze

    def connection
      conn = Faraday.new(
        url: URL,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
