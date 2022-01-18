# frozen_string_literal: true

module PokemonApiShared
  RSpec.shared_context 'PokemonApi with basic checks' do
    let!(:stubbed_request) { stub_request(*request_to_stub).to_return(stubbed_request_result) }
    let!(:access_token) { SecureRandom.uuid }

    before do
      Rails.cache.clear
      stub_const('PokemonApi::Base::BASE_URL', 'https://pokemon_api_base_url')
    end

    it 'makes the request' do
      subject
      expect(stubbed_request).to have_been_requested
    end

    context 'when the request returns an error status' do
      before do
        stub_request(*request_to_stub).to_return(status: 400)
      end

      it 'raises a Faraday exception' do
        expect { subject }.to raise_error(Faraday::BadRequestError)
      end
    end
  end
end

RSpec.configure do |config|
  config.include_context 'PokemonApi with basic checks', pokemon_api: :basic_checks
end
