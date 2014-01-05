# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address '42 Galaxy Road'
    city 'Fielding'
    state 'AZ'
    postal_code '98754'
    description 'Not really a building'
  end
end
