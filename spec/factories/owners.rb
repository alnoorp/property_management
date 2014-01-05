# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name 'Fred'
    last_name 'Hutch'
    email 'fred.hutch@email.com'
    company 'XYZ Corp Ltd.'
  end
end
