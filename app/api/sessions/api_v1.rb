# frozen_string_literal: true

module Sessions
  class APIV1 < Grape::API
    # You can have your API only respond to a single format with format. If you use this,
    #   the API will not respond to file extensions other than specified in format.
    format :json

    rescue_from AppBaseError do |error|
      Rails.logger.error(error)
      rack_response({ error: error.message, status: error.http_code }.to_json, error.http_code)
    end

    rescue_from Exception do |error|
      Rails.logger.error(error)
      rack_response({ error: 'Unexpected server error', status: 500 }.to_json, 500)
    end

    # Mount resource with URL prefix
    mount Sessions::Auth::Ver1  => '/user'
    mount Sessions::Facebook::Ver1
    mount Sessions::Google::Ver1

    add_swagger_documentation(mount_path: '/swagger_doc', base_path: '/', info: {
      title: "Authorization API."
    })
  end
end
