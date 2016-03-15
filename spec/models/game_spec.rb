RSpec.describe Game, type: :model do

  let(:game) { build(:game) }
 
  it 'has a valid factory' do
    expect(game).to be_valid
  end

  it 'is invalid without a name' do
    game.name = nil
    expect(game).to be_invalid
  end

  it "has one after adding one" do
    game.save
    expect(Game.count).to eq 1
  end

  let!(:user) { create(:user) }

  it 'has many users' do
    user.games.create(attributes_for(:game))
    expect(UserGame.count). to eq 1
    expect(user.games.count). to eq 1
  end

  it 'has many properties' do
    game = user.games.create(attributes_for(:game))
    game.game_properties.create(attributes_for(:game_property))
    game.game_properties.create(attributes_for(:game_property))
    expect(game.game_properties.count). to eq 2
  end
end
