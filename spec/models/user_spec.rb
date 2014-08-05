require 'rails_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end
  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to validate_presence_of(:first_name) }
  it { expect(subject).to validate_presence_of(:last_name) }
  it { expect(subject).to validate_presence_of(:email) }
  it { expect(subject).to validate_uniqueness_of(:email) }

  it { expect(subject).to have_many(:reviews) }
  it { expect(subject).to have_and_belong_to_many(:restaurants) }
end
