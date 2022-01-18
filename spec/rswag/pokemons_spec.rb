# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'pokemons', type: :request do
  # path '/pokemons' do
  #   get 'Find all pokemons' do
  #     tags 'Pokemons'

  #     response '200', :success do
  #       schema type: :object,
  #              properties: {
  #                collection: {
  #                  type: :array,
  #                  items: {
  #                    type: :object,
  #                    properties: {
  #                      id: { type: :integer },
  #                      name: { type: :string },
  #                      types: {
  #                        type: :array,
  #                        items: {
  #                          type: :object,
  #                          properties: {
  #                            name: { type: :string }
  #                          }
  #                        }
  #                      }
  #                    }
  #                  }
  #                }
  #              }
  #       let!(:pokemon) { create(:pokemon) }
  #       run_test!
  #     end
  #   end
  # end

  path '/pokemons' do

    post 'Creates a pokemon' do
      before do
        stub_const('PokemonApi::Base::BASE_URL', 'https://pokemon_api_base_url')
        stub_request(:get, 'https://pokemon_api_base_url/pokemon/clefairy')
          .to_return(status: 200, body: { name: 'clefairy' }.to_json, headers: {})
        stub_request(:get, 'https://pokemon_api_base_url/pokemon/')
          .to_return(status: 200, body: {}.to_json, headers: {})
      end

      tags 'Pokemons'
      consumes 'application/json'
      parameter name: :pokemon, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response '201', 'pokemon created' do
        let(:pokemon) { { name: 'clefairy' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:pokemon) { {} }
        run_test!
      end
    end
  end

  path '/pokemons/{id}' do
    get 'Find pokemon by id' do
      tags 'Pokemons'
      parameter name: :id, in: :path, type: :integer
      response '200', :success do
        schema type: :object,
               properties: {
                base_experience: { type: :integer },
                height: { type: :integer },
                is_default: { type: :boolean },
                order: { type: :integer },
                weight: { type: :integer },
                location_area_encounters: { type: :string }
               }
        let!(:id) { create(:pokemon).id }
        run_test!
      end

      # response '404', :not_found do
      #   let!(:id) { 'invalid' }
      #   run_test!
      # end
    end
  end
end
