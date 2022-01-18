# frozen_string_literal: true

RSpec.describe Pokemon, type: :model do
  subject { build(:pokemon) }

  it { is_expected.to be_valid }

  context 'when the name is missing' do
    before { subject.name = nil }

    it { is_expected.not_to be_valid }
  end

  context 'when a pokemon with the same name already exists' do
    before { create(:pokemon, name: subject.name) }

    it { is_expected.not_to be_valid }
  end
end
