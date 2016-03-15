RSpec.describe User, type: :model do

  let(:user) { build(:user) }
 
  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).to be_invalid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to be_invalid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to be_invalid
  end

  it 'has one after adding one' do
    user.save
    expect(User.count).to eq 1
  end

  it 'has many posts' do 
    user.save
    user.posts.create(attributes_for(:post))
    user.posts.create(attributes_for(:post))
    expect(user.posts.count).to eq 2
  end

  it 'has many comments' do
    user.save
    post = user.posts.create(attributes_for(:post))
    comment = user.comments.build(attributes_for(:comment))
    comment.post_id = post.id
    comment.save
    expect(user.comments.count).to eq 1
  end

  it 'has many friends' do
    user.save
    user.friends.create(attributes_for(:user))
    expect(user.friends.count).to eq 1
  end
  
end
