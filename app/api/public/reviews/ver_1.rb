# frozen_string_literal: true

module Public
  module Reviews
    class Ver1 < Grape::API
      # There are four strategies in which clients can reach your API's endpoints:
      #   :path, :header, :accept_version_header and :param. The default strategy is :path.
      # Using :param strategy, clients should pass the desired version as a request parameter,
      #   either in the URL query string or in the request body.
      version 'v1', using: :param, parameter: 'v'

      resource :reviews do
        desc 'Get a list of reviews for a movie'
        params do
          requires :movie_id, type: Integer, desc: 'Movie ID'
        end
        get do
          {
            version: 'v1',
            pagination: { total: 12, offset: 6, limit: 6 },
            reviews: [
              { text: 'Review 001', author: 'Jon Doe' },
              { text: 'Review 002', author: 'Jain Doe' },
              { text: 'Review 003', author: 'Jon Doe' },
              { text: 'Review 004', author: 'Jain Doe' },
              { text: 'Review 005', author: 'Jon Doe' }
            ]
          }
        end
      end
    end
  end
end
