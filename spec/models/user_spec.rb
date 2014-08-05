require 'rails_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_and_belong_to_many(:restaurants) }
end
