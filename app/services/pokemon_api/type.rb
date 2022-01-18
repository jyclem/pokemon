# frozen_string_literal: true

module PokemonApi
  # Type calls the endpoint of the same name in the Pokemon API
  class Type < Base
    ENDPOINT = 'type'

    def call(id_or_name:)
      request = generate_request(url: "#{ENDPOINT}/#{id_or_name.to_s.downcase}")

      cache_result { request.get }
    end
  end
end
