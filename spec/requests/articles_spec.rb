require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe  "Logind" do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    describe 'GET #index' do
      subject { get(articles_path) }

      context '投稿が存在するとき' do
        let(:article) { create(:article, user_id: user.id) }
        before do
          create(:like, user_id: user.id, article_id: article.id)
        end

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it 'article.day が表示されている' do
          subject
          expect(response.body).to include article.day.to_s
        end

        it 'user.name が表示されている' do
          subject
          expect(response.body).to include article.user.name
        end

        it 'article.exercise.name が表示されている' do
          subject
          expect(response.body).to include article.exercise.name
        end

        it 'article.minutes が表示されている' do
          subject
          expect(response.body).to include article.minutes.to_s
        end

        it 'article.body が表示されている' do
          subject
          expect(response.body).to include article.body
        end
      end
    end

    describe 'GET #show' do
      subject { get(article_path(article_id)) }

      context '投稿が存在するとき' do
        let(:article) { create(:article) }
        let(:article_id) { article.id }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it 'article.day が表示されている' do
          subject
          expect(response.body).to include article.day.to_s
        end

        it 'article.exercise.name が表示されている' do
          subject
          expect(response.body).to include article.exercise.name
        end

        it 'article.minutes が表示されている' do
          subject
          expect(response.body).to include article.minutes.to_s
        end

        it 'article.body が表示されている' do
          subject
          expect(response.body).to include article.body
        end

        context ':idに対応するユーザーが存在しないとき' do
          let(:article_id) { 1 }

          it 'エラーが発生する' do
            expect { subject }.to raise_error ActiveRecord::RecordNotFound
          end
        end
      end
    end

    describe 'GET #new' do
      subject { get(new_article_path) }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      subject { post(articles_path, params: params) }

      context 'パラメータが正常なとき' do
        let(:params) { { article: attributes_for(:article) } }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(302)
        end

        it '投稿が保存される' do
          expect { subject }.to change { Article.count }.by(1)
        end

        it '一覧ページにリダイレクトされる' do
          subject
          expect(response).to redirect_to articles_path
        end
      end

      context 'パラメータが異常なとき' do
        let(:params) { { article: attributes_for(:article, :invalid) } }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it '投稿が保存されない' do
          expect { subject }.not_to change(Article, :count)
        end

        it '投稿ページがレンダリングされる' do
          subject
          expect(response.body).to include '投稿'
        end
      end
    end

    describe 'GET #edit' do
      subject { get(edit_article_path(article_id)) }

      context '投稿が存在するとき' do
        let(:article) { create(:article, user_id: user.id) }
        let(:article_id) { article.id }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it 'article.day が表示されている' do
          subject
          expect(response.body).to include article.day.to_s
        end

        it 'article.exercise.name が表示されている' do
          subject
          expect(response.body).to include article.exercise.name
        end

        it 'article.minutes が表示されている' do
          subject
          expect(response.body).to include article.minutes.to_s
        end

        it 'article.body が表示されている' do
          subject
          expect(response.body).to include article.body
        end

        context ':idに対応するユーザーが存在しないとき' do
          let(:article_id) { 1 }

          it 'エラーが発生する' do
            expect { subject }.to raise_error ActiveRecord::RecordNotFound
          end
        end
      end
    end

    describe 'PATCH #update' do
      subject { patch(article_path(article.id), params: params) }
      let(:article) { create(:article, user_id: user.id) }

      context 'パラメータが正常な場合' do
        let(:params) { { article: attributes_for(:article) } }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(302)
        end

        it 'article.day が更新される' do
          origin_day = article.day
          new_day = params[:article][:day]
          expect { subject }.to change { article.reload.day }.from(origin_day).to(new_day)
        end

        it 'article.minutes が更新される' do
          origin_minutes = article.minutes
          new_minutes = params[:article][:minutes]
          expect { subject }.to change { article.reload.minutes }.from(origin_minutes).to(new_minutes)
        end

        it 'article.body が表示されている' do
          origin_body = article.body
          new_body = params[:article][:body]
          expect { subject }.to change { article.reload.body }.from(origin_body).to(new_body)
        end

        it '一覧ページにリダイレクトされる' do
          subject
          expect(response).to redirect_to articles_path
        end
      end

      context 'パラメータが異常なとき' do
        let(:params) { { article: attributes_for(:article, :invalid) } }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it 'article.day が更新されない' do
          expect { subject }.not_to change(article.reload, :day)
        end

        it 'article.minutes が更新されない' do
          expect { subject }.not_to change(article.reload, :minutes)
        end

        it 'article.body が更新されない' do
          expect { subject }.not_to change(article.reload, :body)
        end

        it '編集ページがレンダリングされる' do
          subject
          expect(response.body).to include '編集'
        end
      end

      describe 'DELETE #destroy' do
        subject { delete(article_path(article.id)) }
        let!(:article) { create(:article, user_id: user.id) }

        context 'パラメータが正常な場合' do
          it 'リクエストが成功する' do
            subject
            expect(response).to have_http_status(302)
          end

          it '投稿が削除される' do
            expect { subject }.to change(Article, :count).by(-1)
          end

          it '投稿一覧にリダイレクトすること' do
            subject
            expect(response).to redirect_to(articles_path)
          end
        end
      end
    end
  end
end