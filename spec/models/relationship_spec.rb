require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'バリデーション' do
    subject { relationship.valid? }

    context 'データが条件を満たすとき' do
      let(:relationship) { build(:relationship) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
    context 'follower_id がすでに存在するとき' do
      before do
        @relation = FactoryBot.create(:relationship)
        @user = FactoryBot.build(:relationship)
      end
      let(:relationship) {build(:relationship, follower_id: @relation.follower_id, following_id: @relation.following_id)}
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(relationship.errors[:follower_id]).to include('は同じユーザーを2回以上フォローできません')
      end
    end
  end
end