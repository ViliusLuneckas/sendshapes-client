require "sendshapes/version"

module Sendshapes
   class Client
    attr_reader :api_key, :base_url

    def initialize(api_key, base_url = 'http://widget.sendshapes.com:3000', end_point = 'api3')
      @base_url  = base_url
      @api_key   = api_key
      @connection = RestClient::Resource.new("#{base_url}/#{end_point}")
    end

    def create_transaction(file_path, receiver_email, print_value)
      with_token do |token|
        post_data = { stl_file: File.new(file_path), api_key: api_key, token: token, receiver_email: receiver_email,
                      print_value: print_value }
        post('/api_upload_partner_stl', post_data)['data']['token_link']
      end
    end

    def with_token(&block)
      get_token and yield(@token)
    end

    def get_token
      @token ||= get('/api_create_partner_token', api_key: api_key)['data']['token']
    end

    def get(path, params)
      JSON.parse(@connection[path].get(params: params))
    end

    def post(path, data)
      JSON.parse(@connection[path].post(data))
    end
  end

end
