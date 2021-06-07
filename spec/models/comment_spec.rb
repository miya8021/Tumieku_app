require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーション" do
    context "データが条件を満たすとき" do
      it "保存できる" do
      end
    end
    context "comment が空のとき" do
      it "エラーが発生する" do
      end
    end
    context "comment が141文字以上のとき" do
      it "エラーが発生する" do
      end
    end
  end
end