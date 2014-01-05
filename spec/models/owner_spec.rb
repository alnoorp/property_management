require 'spec_helper'

describe Owner do
  let(:blanks) { ['', nil] }

  it { should_not have_valid(:first_name).when(*blanks) }
  it { should have_valid(:first_name).when('John') }

  it { should_not have_valid(:last_name).when(*blanks) }
  it { should have_valid(:last_name).when('Smith') }

  it { should_not have_valid(:email).when('example', '.com',
    'example@', '@.com', '@', 'example@', *blanks) }
  it { should have_valid(:email).when('john.smith@email.com') }

  context 'user deletes owner and foreign key from associated building' do
  # * If I delete an owner, the owner and its primary key should
  #   no longer be associated with any properties
    it { should have_many(:buildings).dependent(:nullify) }
  end
end
