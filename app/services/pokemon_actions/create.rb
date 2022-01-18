# frozen_string_literal: true

module PokemonActions
  # Creates the Pokemon and its associated types
  class Create < Base
    def call(name)
      @name = name

      pokemon = nil
      ActiveRecord::Base.transaction do
        pokemon = create_pokemon!
        create_pokemon_types!(pokemon)
      end

      @result = pokemon
    rescue ActiveRecord::RecordInvalid, Faraday::ResourceNotFound => e
      @errors = [e.message]
    end

    private

    def pokemon_api_result
      @pokemon_api_result ||= PokemonApi::Pokemon.call(id_or_name: @name)
    end

    def create_pokemon!
      Pokemon.create!(
        pokemon_api_result.slice(
          :name, :base_experience, :height, :is_default, :order, :weight, :location_area_encounters
        )
      )
    end

    def create_pokemon_types!(pokemon)
      pokemon_api_result[:types]&.each do |type|
        pokemon_type = Type.find_or_create_by!(name: type.dig(:type, :name))
        pokemon.types << pokemon_type
      end
    end
  end
end
