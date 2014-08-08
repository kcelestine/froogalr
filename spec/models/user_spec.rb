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

  it 'persists favorites to db' do
    restaurant = FactoryGirl.create(:restaurant)
    user = FactoryGirl.create(:user)
    user.favorite(restaurant)
    expect(user.restaurants.count).to eq(1)
  end

  it 'persists unfavorites to db' do
    restaurant = FactoryGirl.create(:restaurant)
    user = FactoryGirl.create(:user)
    user.favorite(restaurant)
    expect(user.restaurants.count).to eq(1)
    user.unfavorite(restaurant)
    expect(user.restaurants.count).to eq(0)
  end
end
