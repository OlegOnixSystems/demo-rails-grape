# frozen_string_literal: true

module Sessions
  module Facebook
    class Ver1 < Grape::API
      include Sessions::Facebook::Errors

      resource :facebook do
        desc 'Authorize user via Facebook'
        params do
          requires :token, type: String, desc: 'Facebook auth token'
        end
        post do
          # TODO: verify facebook_token, create the new access token and return it

          case rand(1..5)
          when 1
            raise InvalidFacebookTokenError
          when 2
            raise LockedUserError
          end

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
