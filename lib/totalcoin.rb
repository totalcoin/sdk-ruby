require 'rest-client'
require 'json'

module TotalCoin

  class Error < StandardError
    def initialize message
      super message
    end
  end

  class Api
    attr_accessor :api_key, :client_mail

    API_BASE_URL = 'https://api.totalcoin.com/ar/'

    def initialize(client_mail, api_key)
      @api_key = api_key
      @client_mail = client_mail
    end

    def get_access_token
      params = { :ApiKey => @api_key, :Email => @client_mail }
      response = request(:post, 'Security/', params)
      response[:Response][:TokenId]
    end

    def perform_checkout(data)
      request(:post, "Checkout/#{get_access_token}", data)
    end

    def get_merchants
      request(:get, "Merchant/#{get_access_token}")
    end

    def get_ipn_info(reference_id)
      request(:get, "Ipn/#{@api_key}/#{reference_id}")
    end

    private

    def request(method, uri, params={}, headers={})
      method = method.to_sym

      url = API_BASE_URL + uri

      payload = JSON.generate(params) if method == :post || method == :patch

      headers = {
        :content_type => 'application/json',
        :accept => 'application/json'
      }.merge(headers)

      options = {
        :headers => headers,
        :method => method,
        :url => url,
        :payload => payload,
        :verify_ssl => false
      }

      begin
        response = execute_request(options)
        JSON.parse(response, :symbolize_names => true)
      rescue RestClient::Exception => e
        handle_errors e
      end
    end

    def execute_request(options)
      RestClient::Request.execute(options)
    end

    def handle_errors exception
      body = JSON.parse exception.http_body
      raise Error.new(body['Message'])
    end
  end

end
