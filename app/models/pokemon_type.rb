# frozen_string_literal: true

class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type
end
