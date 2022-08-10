# frozen_string_literal: true

module Protected
  class API < Grape::API
    # Defines the response header for all mounted endpoints
    before { header 'X-Request-Uuid', SecureRandom.uuid }

    # You can have your API only respond to a single format with "format". If you use this,
    #   the API will not respond to file extensions other than specified in format.
    format :json

    add_swagger_documentation(mount_path: '/swagger_doc', base_path: '/', info: {
      title: "Authorized area API."
    })
  end
end
