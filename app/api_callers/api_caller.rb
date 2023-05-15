require 'net/http'
require 'uri'
require 'json'

class ApiCaller
  class << self
    def call_api(api_action, version, api_endpoint, payload)

      path = get_basic_url(version, api_endpoint)
      uri = URI(path)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == "https"

      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
      request.body = payload.to_json

      response = http.request(request)

      return response.code.to_i, JSON.parse(response.body)


      private


      def get_basic_url(version, api_endpoint)
          base_url = "http://localhost:3000/"
          api_endpoint = "v#{version}/#{api_endpoint}"
          url = "#{base_url}#{api_endpoint}"
      end

    end
  end
end