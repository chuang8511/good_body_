class ApiCaller
    class << self
        def call_api(api_action, version, api_endpoint, payload)

            path = get_basic_url(version,api_endpoint)
            url = URI(path)
            #binding.pry
      
            http = Net::HTTP.new(url.host, url.port)
            request = ("Net::HTTP" + "::#{api_action.capitalize}").constantize.new(url)
            # http.read_timeout = 10
            request["Content-Type"] = "application/json"
            request.body = payload.to_json
            response = http.request(request)
            code = response.code
            body = response.read_body
            
            return response.code.to_i, body
        end

        private
  
  
        def get_basic_url(version, api_endpoint)
            base_url = "http://localhost:3002/"
            api_endpoint = "v#{version}/#{api_endpoint}"
            url = "#{base_url}#{api_endpoint}"
        end
        
      
    end
end