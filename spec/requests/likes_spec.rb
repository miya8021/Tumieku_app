require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:new_article) { create(:article, user_id: user.id) }
    let(:article_id) { new_article.id }
    subject { post(article_likes_path(article_id), xhr: true) }

    context 'パラメータが正常な場合' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'いいねが保存される' do
        expect { subject }.to change { Article.count }.by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:article) { create(:article, user_id: user.id) }
    before do
      create(:like, user_id: user.id, article_id: article.id)
    end
    subject { delete(article_likes_path(article.id), xhr: true) }

    context 'パラメータが正常な場合' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'いいねが削除される' do
        expect { subject }.to change(Like, :count).by(-1)
      end
    end
  end
end