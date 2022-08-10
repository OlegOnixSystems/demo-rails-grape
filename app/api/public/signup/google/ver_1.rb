# frozen_string_literal: true

module Public
  module Signup
    module Google
      class Ver1 < Grape::API
        # There are four strategies in which clients can reach your API's endpoints:
        #   :path, :header, :accept_version_header and :param. The default strategy is :path.
        # Using :param strategy, clients should pass the desired version as a request parameter,
        #   either in the URL query string or in the request body.
        version 'v1', using: :param, parameter: 'v'

        resource 'signup/google' do
          desc 'Sign-up a user via Facebook'
          params do
            requires :token, type: String, desc: 'Google OAuth token'
          end
          post do
            # TODO: create a new user from google and return access token
            {
              version: 'v1',
              access_toke: SecureRandom.hex(16),
              refresh_token: SecureRandom.hex(16),
              expired_in: 12000
            }
          end
        end
      end
    end
  end
end
