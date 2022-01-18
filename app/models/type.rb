# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy, inverse_of: :type
  has_many :pokemons, through: :pokemon_types

  validates :name, presence: true, uniqueness: true
end
