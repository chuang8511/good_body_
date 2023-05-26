require 'net/http'
require 'uri'
require 'json'

class ApiCaller
  class << self
    def call_api(api_action, version, api_endpoint, payload)
      
      # 組合 Api 的 URL
      path = get_basic_url(version, api_endpoint)
      uri = URI(path)

      # 建立 HTTP 連線
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == "https"

      # 建立 POST 請求
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
      request.body = payload.to_json

      # 發送請求並取得回應
      response = http.request(request)

      # 將回應的狀態碼和內容解析並回傳
      return response.code.to_i, JSON.parse(response.body)


      private


      def self.get_basic_url(version, api_endpoint)
          base_url = "http://localhost:3000/"
          api_endpoint = "v#{version}/#{api_endpoint}"
          url = "#{base_url}#{api_endpoint}"
      end

    end
  end
end