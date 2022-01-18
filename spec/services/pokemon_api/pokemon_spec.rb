# frozen_string_literal: true

require './spec/services/pokemon_api/shared'

describe PokemonApi::Pokemon, pokemon_api: :basic_checks do
  let(:request_to_stub) { [:get, 'https://pokemon_api_base_url/pokemon/pokemon_name'] }
  let(:stubbed_request_result) { { status: 200, body: '{"name":"pokemon_name"}' } }

  subject { described_class.call(id_or_name: 'pokemon_name') }

  it 'calls the api with the right parameters' do
    expect_any_instance_of(Faraday::Connection).to receive(:get)
      .and_return(double(body: stubbed_request_result.to_json))

    subject
  end

  it 'returns the result' do
    expect(subject).to eql('name' => 'pokemon_name')
  end
end
