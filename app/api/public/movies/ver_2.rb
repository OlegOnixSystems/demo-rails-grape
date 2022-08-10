# frozen_string_literal: true

module Public
  module Movies
    class Ver2 < Grape::API
      # There are four strategies in which clients can reach your API's endpoints:
      #   :path, :header, :accept_version_header and :param. The default strategy is :path.
      # Using :param strategy, clients should pass the desired version as a request parameter,
      #   either in the URL query string or in the request body.
      version 'v2', using: :param, parameter: 'v'

      resource :movies do
        desc 'Get a list of movies'
        get do
          {
            version: 'v2',
            pagination: { total: 12, offset: 6, limit: 6 },
            movies: [
              { title: 'Movie 001', year: '2018', director: 'Jon Doe' },
              { title: 'Movie 002', year: '2019', director: 'Jon Doe' },
              { title: 'Movie 003', year: '2014', director: 'Jon Doe' },
              { title: 'Movie 004', year: '2015', director: 'Jon Doe' },
              { title: 'Movie 005', year: '2019', director: 'Jon Doe' }
            ]
          }
        end
      end
    end
  end
end
