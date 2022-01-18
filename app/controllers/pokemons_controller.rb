# frozen_string_literal: true

# CRUD for Pokemon
class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show update destroy]

  def index
    @pokemons = Pokemon.includes(:types).all

    render json: pokemons_with_types, only: %i[id name types]
  end

  def show
    render json: @pokemon, only: %i[base_experience height is_default order weight location_area_encounters]
  end

  # we create a pokemon by passing the name, so that we can fetch the information from the Pokemon API
  def create
    pokemon = PokemonActions::Create.call(params.dig(:pokemon, :name))

    if pokemon.errors
      render json: pokemon.errors, status: :unprocessable_entity
    else
      render json: pokemon.result, status: :created
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit \
      :name, :base_experience, :height, :is_default, :order, :weight, :location_area_encounters
  end

  def pokemons_with_types
    @pokemons.map do |pokemon|
      pokemon.attributes.merge(types: pokemon.types.map { |type| type.slice(:name) }).with_indifferent_access
    end
  end
end
