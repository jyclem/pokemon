# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy, inverse_of: :pokemon
  has_many :types, through: :pokemon_types

  validates :name, presence: true, uniqueness: true
end
