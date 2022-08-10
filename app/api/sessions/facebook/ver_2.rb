# frozen_string_literal: true

module Sessions
  module Facebook
    class Ver2 < Grape::API
      resource :facebook do
        desc 'Authorize user via Facebook'
        params do
          requires :token, type: String, desc: 'Facebook auth token'
        end
        post do
          # TODO: verify facebook_token, create the new access token and return it
          {
            version: 'v2',
            access_toke: SecureRandom.hex(16),
            refresh_token: SecureRandom.hex(16),
            expired_in: 19000
          }
        end
      end
    end
  end
end
