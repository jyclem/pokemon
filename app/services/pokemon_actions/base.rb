# frozen_string_literal: true

module PokemonActions
  # Base contains what is shared by all PokemonActions services
  class Base
    attr_accessor :errors, :result

    def self.call(params)
      instance = new
      instance.call(params)
      instance
    end
  end
end
