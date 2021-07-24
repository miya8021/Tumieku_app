require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'バリデーション' do
    subject { like.valid? }

    context 'データが条件を満たすとき' do
      let(:like) { build(:like) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
    context 'article_id がすでに存在するとき' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user_id: user.id) }
      before do
        create(:like, user_id: user.id, article_id: article.id)
      end
      let(:like) { build(:like, user_id: user.id, article_id: article.id) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(like.errors.messages[:user_id]).to include 'は同じ投稿に2回以上いいねはできません'
      end
    end
  end
end
