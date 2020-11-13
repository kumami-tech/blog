require 'rails_helper'

describe Comment do
  describe '#create' do
    it "全て入力されていれば投稿できること" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "ニックネームが空の場合は投稿できないこと" do
      comment = build(:comment, nickname: nil)
      comment.valid?
      expect(comment.errors[:nickname]).to include("を入力してください")
    end

    it "コメントが空の場合は投稿できないこと" do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end
  end
end