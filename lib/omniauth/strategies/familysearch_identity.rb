require 'omniauth-oauth'
require 'oauth/signature/plaintext'

module OmniAuth
  module Strategies
    class FamilySearchIdentity < OmniAuth::Strategies::OAuth

      option :name, 'familysearch_identity'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
	:signature_method => 'PLAINTEXT',
	:scheme => :query_string,
	:http_method => :get,
	:site => 'https://api.familysearch.org',
	:request_token_path => '/identity/v2/request_token',
	:access_token_path => '/identity/v2/access_token',
	:authorize_path => '/identity/v2/authorize'
      }

      def request_phase
	super
      end

      def authorize_params
	super
      end

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { info[:nickname] }

      info do
	{
	  :name => user_name,
	  :email => user_email,
	  :nickname => user_info['username'],
	  :first_name => user_first_name,
	  :last_name => user_last_name
	}
      end

      extra do
	{ :raw_info => raw_info }
      end

      def raw_info
	request = "/identity/v2/user?sessionId=#{access_token.token}&dataFormat=application/json"
	@raw_info ||= MultiJson.decode(access_token.get(request).body)
      rescue ::Errno::ETIMEDOUT
	raise ::Timeout::Error
      end

      private

      def user_info
	raw_info['users'].first
      end

      def user_email
	email = user_info['emails'].find { |email| email['type'] == 'Primary' }

	unless email.nil?
	  email['value']
	end
      end

      def user_name
	user_names['Display']
      end

      def user_first_name
	user_names['Given']
      end

      def user_last_name
	user_names['Family']
      end

      def user_names
	@user_names ||= begin
			  hash = {}

			  user_info['names'].each do |name|
			    hash[name['type']] = name['value']
			  end

			  hash
			end
      end

    end
  end
end

OmniAuth.config.add_camelization 'familysearch_identity', 'FamilySearchIdentity'
