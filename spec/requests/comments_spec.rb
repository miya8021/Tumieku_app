require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe  "Logind" do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

  describe 'POST #create' do
    context 'パラメータが正常なとき' do

      it 'リクエストが成功する' do
      end

      it 'ユーザーが保存される' do
      end

      it '詳細ページにリダイレクトされる' do
      end
    end

    context 'パラメータが異常なとき' do
      it 'リクエストが成功する' do
      end

      it 'ユーザーが保存されない' do
      end

      it '新規投稿ページがレンダリングされる' do
      end
    end
    end
  end
  # コントロラー
  # create
  # destroy
  # ユーザーネームとコメントの内容を表示
end
