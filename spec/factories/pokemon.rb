FactoryBot.define do
  factory :pokemon do
    name { 'clefairy' }
    base_experience { 113 }
    height { 6 }
    is_default { true }
    order { 56 }
    weight { 75 }
    location_area_encounters { '/api/v2/pokemon/35/encounters' }
  end
end
