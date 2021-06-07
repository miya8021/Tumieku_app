require 'rails_helper'

RSpec.describe Article, type: :model do
   describe 'バリデーション' do
    subject { article.valid? }
    context 'データが条件を満たすとき' do
      let(:article) { build(:article) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
    context 'day が空のとき' do
      let(:article) { build(:article, day: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:day]).to include 'を入力してください'
      end
    end
    context 'minutes が空のとき' do
      let(:article) { build(:article, minutes: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:minutes]).to include 'を入力してください'
      end
    end
    context 'minutes が文字列のとき' do
      let(:article) { build(:article, minutes: 'a') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:minutes]).to include 'は数値で入力してください'
      end
    end
    context 'minutes が負の整数のとき' do
      let(:article) { build(:article, minutes: -1 ) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:minutes]).to include 'は一覧にありません'
      end
    end
    context 'minutes が301以上のとき' do
      let(:article) { build(:article, minutes: 301 ) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:minutes]).to include 'は一覧にありません'
      end
    end
    context 'body が空のとき' do
      let(:article) { build(:article, body: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:body]).to include 'を入力してください'
      end
    end
    context 'body が141文字以上のとき' do
      let(:article) { build(:article, body: 'a' * 141 ) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(article.errors.messages[:body]).to include 'は140文字以内で入力してください'
      end
    end
  end
end
