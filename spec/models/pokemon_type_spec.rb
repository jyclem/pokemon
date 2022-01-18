# frozen_string_literal: true

RSpec.describe PokemonType, type: :model do
  subject { create(:pokemon_type) }

  it { is_expected.to be_valid }
end
