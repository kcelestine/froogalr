require 'rails_helper'

describe User do
it { is_expected.to validate_presence_of(:username) }
it { is_expected.to validate_uniqueness_of(:username) }
it { is_expected.to validate_presence_of(:first_name) }
it { is_expected.to validate_presence_of(:last_name) }
it { is_expected.to validate_presence_of(:password) }

it { is_expected.to have_many(:reviews) }
it { is_expected.to have_secure_password } 
end