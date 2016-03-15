RSpec.describe GameProperty, type: :model do

  let(:game_property) { build(:game_property) }
 
  it 'has a valid factory' do
    expect(game_property).to be_valid
  end

  it 'is invalid without a name' do
    game_property.name = nil
    expect(game_property).to be_invalid
  end

  it 'is invalid without a game' do
    game_property.game_id = nil
    expect(game_property).to be_invalid
  end

  it 'has one after adding one' do
    game_property.save
    expect(GameProperty.count).to eq 1
  end

  let!(:game) { create(:game) }

  it 'belongs to game' do
    property = game.game_properties.create(attributes_for(:game_property))
    expect(property.game.id). to eq game.id
  end

  let!(:user) { create(:user) }
  
  it 'has many user_game_properties' do
    game = user.games.create(attributes_for(:game))
    property = game.game_properties.create(attributes_for(:game_property))
    property.user_game_properties.create(user_id: user.id, game_property_id: property.id)
    expect(property.user_game_properties.count). to eq 1
  end

end
