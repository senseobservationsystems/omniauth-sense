require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Sense < OmniAuth::Strategies::OAuth
      option :name, 'sense'
      option :client_options, {
        :site => 'https://api.sense-os.nl',
        :request_token_path => '/oauth/request_token',
        :access_token_path => '/oauth/access_token',
        :authorize_path => '/oauth/authorize'
      }

      uid { raw_info['user']['id'] }

      info { raw_info['user'] }

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||=
          begin
            current_user_request = @access_token.get('/users/current.json')
            body = current_user_request.body
            MultiJson.load(body)
          end
      end
    end
  end
end
