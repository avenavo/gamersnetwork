RSpec.describe Post, type: :model do


  let(:post) { build(:post) }
 
  it 'has a valid factory' do
    expect(post).to be_valid
  end

  it 'is invalid without a content' do
    post.post = nil
    expect(post).to be_invalid
  end

  it 'is invalid without an author' do
    post.user_id = nil
    expect(post).to be_invalid
  end

  it 'is invalid with more than 1000 characters' do
    post.post = Faker::Lorem.characters(1001)
    expect(post).to be_invalid
  end

  it 'has one after adding one' do
    post.save
    expect(Post.count).to eq 1
  end
  
  let!(:user) { create(:user) }

  it 'has many comments' do
    post = user.posts.create(attributes_for(:post))
    post.comments.create(attributes_for(:comment))
    post.comments.create(attributes_for(:comment))
    expect(post.comments.count). to eq 2
  end

  it 'belongs to user' do
    post = user.posts.create(attributes_for(:post))
    expect(post.user.id). to eq user.id
  end



end
