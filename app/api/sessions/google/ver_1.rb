# frozen_string_literal: true

module Sessions
  module Google
    class Ver1 < Grape::API
      resource :facebook do
        desc 'Authorize user via Google'
        params do
          requires :token, type: String, desc: 'Google oauth token'
        end
        post do
          # TODO: verify facebook_token, create the new access token and return it
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
