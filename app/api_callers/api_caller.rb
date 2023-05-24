# require 'uri'
# require 'net/http'

# class ApiCaller

#     class << self
#       def call_api(api_action, version, api_endpoint, payload)
  
#         path = get_basic_url(version, api_endpoint)
#         url = URI(path)
  
#         http = Net::HTTP.new(url.host, url.port)
#         request = ("Net::HTTP" + "::#{api_action.capitalize}").constantize.new(url)
  
#         request["Content-Type"] = "application/json"
  
#         request.body = payload.to_json
  
#         response = http.request(request)
#         code = response.code
#         body = response.read_body
#         { code: code, body: body }

#       end

#       private


#       def get_basic_url(version, api_endpoint)
#         base_url = "http://localhost:3000/"
#         api_endpoint = "v#{version}/#{api_endpoint}"
#         url = "#{base_url}#{api_endpoint}"

#       end
#     end
# end

# class ApiCaller
#   class << self
#     def http
#       @http ||= begin
#         http = Net::HTTP.new('localhost', 3000)
#         # http.use_ssl = true
#         # http.ssl_version = :TLSv1_2
#         http
#       end
#     end

#     def call_api(method, url, api_endpoint, payload = {}, headers = {})
#       uri = URI("#{url}/#{api_endpoint}")
#       request = Net::HTTP.const_get(method.capitalize).new(uri)

#       headers.each { |k, v| request[k] = v }

#       request.body = payload.to_json

#       response = http.request(request)
#       code = response.code
#       body = response.read_body

#       { code: code, body: body }
#     end
#   end
# end







