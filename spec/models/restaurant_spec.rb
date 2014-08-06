require 'rails_helper'

describe Restaurant do
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }

  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_and_belong_to_many(:users)}
end
