RSpec.describe UserGameProperty, type: :model do

  let(:user_game_property) { build(:user_game_property) }
 
  it 'has a valid factory' do
    expect(user_game_property).to be_valid
  end

  it 'is invalid without a property' do
    user_game_property.game_property_id = nil
    expect(user_game_property).to be_invalid
  end

  it 'is invalid without an user ' do
    user_game_property.user_id = nil
    expect(user_game_property).to be_invalid
  end

  it 'has one after adding one' do
    user_game_property.save
    expect(UserGameProperty.count).to eq 1
  end

  let!(:game) { create(:game) }
  let!(:user) { create(:user) }
  
  it 'belongs to game_property' do
    property = game.game_properties.create(attributes_for(:game_property))
    user_game_property = property.user_game_properties.create(user_id: user.id, game_property_id: property.id)
    expect(user_game_property.game_property.id). to eq property.id
  end

  it 'belongs to user' do
    property = game.game_properties.create(attributes_for(:game_property))
    user.games << game
    user.user_game_properties.create(game_property_id: property.id)
    expect(user.user_game_properties.count).to eq 1
  end

end
