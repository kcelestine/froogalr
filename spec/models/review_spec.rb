require 'rails_helper'

describe Review do
  it { is_expected.to validate_presence_of(:comment) }
  it { is_expected.to validate_presence_of(:worth_it) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:restaurant_id) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:restaurant) }
end