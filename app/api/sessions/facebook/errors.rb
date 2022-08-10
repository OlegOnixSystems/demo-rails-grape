# frozen_string_literal: true

module Sessions
  module Facebook
    module Errors
      class InvalidFacebookTokenError < AppBaseError
        http_code 401
        default_message 'It is impossible to finish sign-in. Please try later.'
      end

      class LockedUserError < AppBaseError
        http_code 401
        default_message 'The user is locked.'
      end
    end
  end
end
