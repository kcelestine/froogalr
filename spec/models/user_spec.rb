require 'rails_helper'

describe User do
  let(:alex) { User.create! username: 'aaackerman', first_name: 'Alex', last_name: 'Ackerman', email: 'aaackerman@yahoo.com'}

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_and_belong_to_many(:restaurants) }

end
