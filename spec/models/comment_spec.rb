RSpec.describe Comment, type: :model do

  let(:comment) { build(:comment) }
 
  it 'has a valid factory' do
    expect(comment).to be_valid
  end

  it 'is invalid without a content' do
    comment.comment = nil
    expect(comment).to be_invalid
  end

  it 'is invalid without an author' do
    comment.user_id = nil
    expect(comment).to be_invalid
  end

  it 'is invalid without a post' do
    comment.post_id = nil
    expect(comment).to be_invalid
  end

  it 'is invalid with more than 500 characters' do
    comment.comment = Faker::Lorem.characters(501)
    expect(comment).to be_invalid
  end

  it 'has one after adding one' do
    comment.save
    expect(Comment.count).to eq 1
  end

  let!(:post) { create(:post) }

  it 'belongs to post' do
    comment = post.comments.create(attributes_for(:comment))
    expect(comment.post.id). to eq post.id
  end

  let!(:user) { create(:user) }

  it 'belongs to user' do
    comment = user.comments.create(attributes_for(:comment))
    expect(comment.user.id). to eq user.id
  end

end
