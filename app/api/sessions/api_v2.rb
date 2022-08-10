# frozen_string_literal: true

module Sessions
  class APIV2 < Grape::API
    # You can have your API only respond to a single format with format. If you use this,
    #   the API will not respond to file extensions other than specified in format.
    format :json

    mount Sessions::Facebook::Ver2

    add_swagger_documentation(mount_path: '/swagger_doc', base_path: '/', info: {
      title: "Authorization API."
    })
  end
end
