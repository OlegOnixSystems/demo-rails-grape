# frozen_string_literal: true

module Sessions
  module Auth
    class Ver1 < Grape::API
      resource :auth do
        desc 'Get user access token'
        params do
          # GrapeTypes::Email is a custom defined type of parameter
          requires :email, type: GrapeTypes::Email, desc: 'User account e-mail'
          requires :password, type: String, desc: 'User account password'
        end
        post :token do
          # TODO: verify user email and password, create the new access token and return it
          {
            version: 'v1',
            access_toke: SecureRandom.hex(16),
            refresh_token: SecureRandom.hex(16),
            expired_in: 18000
          }
        end

        desc 'Refresh user access token'
        params do
          requires :token, type: String, desc: 'Refresh token'
        end
        post :refresh do
          # TODO: verify user refresh token, create the new access token and return it
          {
            version: 'v1',
            access_toke: SecureRandom.hex(16),
            refresh_token: SecureRandom.hex(16),
            expired_in: 18000
          }
        end

        desc 'Revoke user access token'
        delete :revoke do
          # TODO: revoke the active access token
          { version: 'v1', success: true }
        end
      end
    end
  end
end
