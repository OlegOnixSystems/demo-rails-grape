# frozen_string_literal: true

module Public
  module Movies
    class Ver1 < Grape::API
      # There are four strategies in which clients can reach your API's endpoints:
      #   :path, :header, :accept_version_header and :param. The default strategy is :path.
      # Using :param strategy, clients should pass the desired version as a request parameter,
      #   either in the URL query string or in the request body.
      version 'v1', using: :param, parameter: 'v'

      resource :movies do
        desc 'Get a list of movies'
        get do
          {
            version: 'v1',
            pages: { total: 3, current: 2, per_page: 6 },
            movies: [
              { title: 'Movie 001', year: '2018' },
              { title: 'Movie 002', year: '2019' },
              { title: 'Movie 003', year: '2014' },
              { title: 'Movie 004', year: '2015' },
              { title: 'Movie 005', year: '2019' }
            ]
          }
        end

        desc 'Get a list of top rated movies'
        get :top do
          {
            version: 'v1',
            movies: [
              { title: 'Top movie 014', year: '2014' },
              { title: 'Top movie 015', year: '2018' },
              { title: 'Top movie 016', year: '2012' },
              { title: 'Top movie 017', year: '2019' },
              { title: 'Top movie 018', year: '2015' }
            ]
          }
        end

        desc 'Get a list of latest released movies'
        get :latest do
          {
            version: 'v1',
            movies: [
              { title: 'Latest movie 024', year: '2014' },
              { title: 'Latest movie 025', year: '2018' },
              { title: 'Latest movie 026', year: '2012' },
              { title: 'Latest movie 027', year: '2019' },
              { title: 'Latest movie 028', year: '2015' }
            ]
          }
        end
      end
    end
  end
end
