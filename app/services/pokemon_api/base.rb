# frozen_string_literal: true

require 'faraday/httpclient'

# Check the Pokemon API here: https://pokeapi.co/docs/v2#pokemon
module PokemonApi
  # Base contains what is shared by all PokemonApi services
  class Base < ::Service
    BASE_URL = 'https://pokeapi.co/api/v2'

    # make sure to call generate_request before cache_result
    def generate_request(url:, params: {})
      @request = Faraday.new(url: "#{BASE_URL}/#{url}", params: params) do |f|
        f.request :json
        f.adapter :httpclient
        f.use Faraday::Response::RaiseError
      end
    end

    # we want to avoid overloading the Pokemon API as requested in the documentation so we update
    # the data every week only
    def cache_result(&block)
      Rails.cache.fetch(cache_key, expires_in: 10.weeks) { format_response(block.call) }
    end

    private

    def cache_key
      "#{@request.url_prefix}-#{@request.params.sort.flatten.join('_')}"
    end

    def format_response(response)
      JSON.parse(response.body).with_indifferent_access
    end
  end
end
