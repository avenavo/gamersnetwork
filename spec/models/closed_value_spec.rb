RSpec.describe ClosedValue, type: :model do

  let(:closed_value) { build(:closed_value) }
 
  it 'has a valid factory' do
    expect(closed_value).to be_valid
  end

  it 'is invalid without a game_property' do
    closed_value.game_property_id = nil
    expect(closed_value).to be_invalid
  end

  it 'is invalid without a value' do
    closed_value.value = nil
    expect(closed_value).to be_invalid
  end

  it 'has one after adding one' do
    closed_value.save
    expect(ClosedValue.count).to eq 1
  end
  
  let!(:game) { create(:game) }

  it 'belongs to game_property' do
    property = game.game_properties.build(attributes_for(:game_property))
    property.isclosed=true
    property.save
    value = property.closed_values.create{attributes_for(:closed_value)}
    expect(value.game_property.id). to eq property.id
  end



end
