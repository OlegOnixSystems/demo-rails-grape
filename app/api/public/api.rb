# frozen_string_literal: true

module Public
  class API < Grape::API
    # Defines the response header for all mounted endpoints
    before { header 'X-Request-Uuid', SecureRandom.uuid }

    # You can have your API only respond to a single format with "format". If you use this,
    #   the API will not respond to file extensions other than specified in format.
    format :json

    rescue_from Exception do |error|
      Rails.logger.error(error)
      rack_response({ error: 'Unexpected server error' }.to_json, 500)
    end

    mount Public::Movies::Ver1
    mount Public::Movies::Ver2
    mount Public::Reviews::Ver1
    mount Public::Signup::Ver1
    mount Public::Signup::Facebook::Ver1
    mount Public::Signup::Google::Ver1

    add_swagger_documentation(mount_path: '/public/swagger_doc', base_path: '/', info: {
      title: "Public area API."
    })
  end
end
