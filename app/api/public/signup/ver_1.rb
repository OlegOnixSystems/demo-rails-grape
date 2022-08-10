# frozen_string_literal: true

module Public
  module Signup
    class Ver1 < Grape::API
      # There are four strategies in which clients can reach your API's endpoints:
      #   :path, :header, :accept_version_header and :param. The default strategy is :path.
      # Using :param strategy, clients should pass the desired version as a request parameter,
      #   either in the URL query string or in the request body.
      version 'v1', using: :param, parameter: 'v'

      resource :signup do
        desc 'Sign-up a user'
        params do
          requires :email, type: GrapeTypes::Email, desc: 'User account e-mail'
          requires :password, type: String, desc: 'User account password'
          requires :password_confirm, type: String, desc: 'User account password confirmation'
          requires :name, type: String, desc: 'Name of the user'
          requires :date_of_birth, type: Date, desc: 'User date of birth'
        end
        post do
          # TODO: create a new user and return access token
          {
            version: 'v1',
            access_toke: SecureRandom.hex(16),
            refresh_token: SecureRandom.hex(16),
            expired_in: 18000
          }
        end
      end
    end
  end
end
