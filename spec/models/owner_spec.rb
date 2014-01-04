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

end
