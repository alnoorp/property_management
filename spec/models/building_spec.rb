require 'spec_helper'

describe Building do
  let(:blanks) { ['', nil] }

  it { should_not have_valid(:street_address).when(*blanks) }
  it { should have_valid(:street_address).when('123 Any Street') }

  it { should_not have_valid(:city).when(*blanks) }
  it { should have_valid(:city).when('Boulder') }

  it { should_not have_valid(:state).when('23', 'ZX', 'abc', 'a4', 'New York', 'ny', *blanks) }
  it { should have_valid(:state).when('CO') }

  it { should_not have_valid(:postal_code).when('123456', 'abcde', '123ab', *blanks) }
  it { should have_valid(:postal_code).when('01234') }

  it { should have_valid(:description).when('This is a building', *blanks) }

end
