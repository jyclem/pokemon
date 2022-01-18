# frozen_string_literal: true

describe PokemonActions::Create do
  let(:name) { 'pokemon_name' }
  subject { described_class.call(name) }

  before do
    allow(PokemonApi::Pokemon).to receive(:call).and_return(
      name: name, types: [{ type: { name: 'type_name' } }]
    )
  end

  it 'creates a new Pokemon' do
    expect { subject }.to change { Pokemon.count }.by(1)
  end

  it 'creates it with the right name' do
    # Warning: might not work in case of parallelized tests
    subject
    expect(Pokemon.last.name).to eql('pokemon_name')
  end

  it 'creates a new type do' do
    expect { subject }.to change { Type.count }.by(1)
  end

  it 'associate the type to the pokemon' do
    # Warning: might not work in case of parallelized tests
    subject
    expect(Pokemon.last.types.last).to eql(Type.last)
  end

  it 'creates it with the right name' do
    # Warning: might not work in case of parallelized tests
    subject
    expect(Type.last.name).to eql('type_name')
  end

  it 'returns the pokemon in the result attribute' do
    # Warning: might not work in case of parallelized tests
    expect(subject.result).to eql(Pokemon.last)
  end

  context 'when an error occurs' do
    before do
      allow(Pokemon).to receive(:create!).and_raise(Faraday::ResourceNotFound, 'error message')
    end

    it 'returns the error in the errors attribute' do
      expect(subject.errors).to eql(['error message'])
    end

    it 'does not create a new Pokemon' do
      expect { subject }.not_to(change { Pokemon.count })
    end

    it 'does not create a new Type' do
      expect { subject }.not_to(change { Type.count })
    end
  end
end
