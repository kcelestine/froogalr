require 'rails_helper'

describe Restaurant do
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }

  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_and_belong_to_many(:users)}

  it 'correctly calculates average rating' do
    restaurant = FactoryGirl.create(:restaurant)
    FactoryGirl.create(:r1)
    FactoryGirl.create(:r2)
    FactoryGirl.create(:r3)
    expect(restaurant.average_worth_it()).to eq(4)
  end

  it 'sends the correct worth it response for an average rating of 5' do
    restaurant = FactoryGirl.create(:restaurant)
    expect(restaurant.worth_it_rating(5)).to eq('Totally Worth it!')
  end

  it 'sends the correct worth it response for an average rating of 4' do
    restaurant = FactoryGirl.create(:restaurant)
    expect(restaurant.worth_it_rating(4)).to eq('Pretty Worth it!')
  end

  it 'sends the correct worth it response for an average rating of 3' do
    restaurant = FactoryGirl.create(:restaurant)
    expect(restaurant.worth_it_rating(3)).to eq('Kinda Worth it!')
  end

  it 'sends the correct worth it response for an average rating of 2' do
    restaurant = FactoryGirl.create(:restaurant)
    expect(restaurant.worth_it_rating(2)).to eq('Not Worth it!')
  end

  it 'sends the correct worth it response for an average rating of 1' do
    restaurant = FactoryGirl.create(:restaurant)
    expect(restaurant.worth_it_rating(1)).to eq('Meh!')
  end
end
