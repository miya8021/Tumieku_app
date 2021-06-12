require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe  "Logind" do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    describe "GET #index" do
      subject { get(exercises_path) }

      context "エクササイズが存在するとき" do
        before { create_list(:exercise, 3) }
        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it 'exercise.name が表示されている' do
          subject
          expect(response.body).to include(*Exercise.pluck(:name))
        end
      end
    end

    describe 'GET #new' do
      subject { get(new_exercise_path) }
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      subject { post(exercises_path, params: params) }
      context 'パラメータが正常なとき' do
        let(:params) { { exercise: attributes_for(:exercise) } }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(302)
        end

        it 'エクササイズが保存される' do
          expect { subject }.to change { Exercise.count }.by(1)
        end

        it '詳細ページにリダイレクトされる' do
          subject
          expect(response).to redirect_to exercises_path
        end
      end

      context 'パラメータが異常なとき' do
        let(:params) { { exercise: attributes_for(:exercise, :exercise_invalid) } }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(200)
        end

        it 'エクササイズが保存されない' do
          expect { subject }.not_to change(Exercise, :count)
        end

        it 'エクササイズ登録ページがレンダリングされる' do
          subject
          expect(response.body).to include '登録'
        end
      end

      describe 'GET #edit' do
        subject { get(edit_exercise_path(exercise_id)) }

        context '登録エクササイズが存在するとき' do
          let(:exercise) { create(:exercise) }
          let(:exercise_id) { exercise.id }

          it 'リクエストが成功する' do
            subject
            expect(response).to have_http_status(200)
          end

          it 'exercise.name が表示されている' do
            subject
            expect(response.body).to include exercise.name
          end
        end

        context ':idに対応するエクササイズが存在しないとき' do
          let(:exercise_id) { 1 }

          it 'エラーが発生する' do
            expect { subject }.to raise_error ActiveRecord::RecordNotFound
          end
        end
      end

      describe 'PATCH #update' do
        subject { patch(exercise_path(exercise.id), params: params) }
        let(:exercise) { create(:exercise, name: "背筋") }

        context 'パラメータが正常な場合' do
          let(:params) { { exercise: attributes_for(:exercise) } }

          it 'リクエストが成功する' do
            subject
            expect(response).to have_http_status(302)
          end

          it 'exercise.name が更新される' do
            origin_name = exercise.name
            new_name = params[:exercise][:name]
            expect { subject }.to change{ exercise.reload.name }.from(origin_name).to(new_name)
          end

          it '一覧ページにリダイレクトされる' do
            subject
            expect(response).to redirect_to exercises_path
          end
        end

        context 'exerice のパラメータが異常なとき' do
          let(:params) { { exercise: attributes_for(:exercise, :exercise_invalid) } }

          it 'リクエストが成功する' do
            subject
            expect(response).to have_http_status(200)
          end

          it 'exercise.name が更新されない' do
            expect { subject }.not_to change(exercise.reload, :name)
          end

          it '編集ページがレンダリングされる' do
            subject
            expect(response.body).to include '編集'
          end
        end

        describe 'DELETE #destroy' do
          subject { delete(exercise_path(exercise.id)) }
          let!(:exercise) { create(:exercise) }

          context 'パラメータが正常な場合' do
            it 'リクエストが成功する' do
              subject
              expect(response).to have_http_status(302)
            end

            it 'エクササイズが削除される' do
              expect { subject }.to change(Exercise, :count).by(-1)
            end

            it '一覧ページにリダイレクトすること' do
              subject
              expect(response).to redirect_to(exercises_path)
            end
          end
        end
      end
    end
  end
end
