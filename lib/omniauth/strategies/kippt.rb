require 'nokogiri'
require 'omniauth-http-basic'

module OmniAuth
  module Strategies
    class Kippt < OmniAuth::Strategies::HttpBasic

      option :title,    "Kippt Login"

      uid { content_of('Profile/details/userId') }

      credentials { {:username => username, :password => password, :expires_days => content_of('Profile/passwordExpiresDays')} }

      info do
        { :name => "#{content_of('Profile/details/firstName')} #{content_of('Profile/details/lastName')}",
          :nickname => request['username'] }
      end

      extra do
        { :number => content_of('Profile/details/number'),
          :extension => content_of('Profile/details/extension'),
          :group     => content_of('Profile/details/groupId'),
          :provider  => content_of('Profile/details/serviceProvider') }
      end

      protected

        def api_uri
          "#{options.endpoint}/account"
        end

        def username
          return unless request['username']
          request['username'].index('@') ? request['username'] : [request['username'], options.domain].join('@')
        end

        def xml_response
          @xml_response ||= Nokogiri.XML(authentication_response.body)
        end

        def content_of(path)
          xml_response.search(path).first.content
        end
    end
  end
end
