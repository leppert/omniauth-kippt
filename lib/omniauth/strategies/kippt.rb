require 'multi_json'
require 'omniauth-http-basic'

module OmniAuth
  module Strategies
    class Kippt < OmniAuth::Strategies::HttpBasic

      option :title,          "Kippt Login"
      option :username_label, "Email"

      uid { raw_info['id'] }

      credentials do
        { :token => raw_info['api_token'] }
      end

      info do
        {
          :nickname => raw_info['username'],
          :urls => { 'Kippt' => "http://kippt.com/#{raw_info['app_url']}" }
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      protected

        def api_uri
          "#{options.endpoint}/account"
        end

        def raw_info
          @raw_info ||= MultiJson.load(authentication_response.body)
        end

    end
  end
end
