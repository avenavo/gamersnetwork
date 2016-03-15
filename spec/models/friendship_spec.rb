RSpec.describe Friendship, type: :model do

  let(:friendship) { build(:friendship) }
 
  it 'has a valid factory' do
    expect(friendship).to be_valid
  end

  it 'is invalid without an first user' do
    friendship.user_id = nil
    expect(friendship).to be_invalid
  end

  it 'is invalid without an second user' do
    friendship.friend_id = nil
    expect(friendship).to be_invalid
  end

  it 'is invalid without a status' do
    friendship.status = nil
    expect(friendship).to be_invalid
  end

  it 'has one after adding one' do
    friendship.save
    expect(Friendship.count).to eq 1
  end
  
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  it 'user has many friends' do
    user.friends << user2
    expect(user.friends.count).to eq 1
  end

end
