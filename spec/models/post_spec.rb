require 'rails_helper'

describe Post do
  describe '#create' do
    it "全て入力されていれば投稿できること" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "タイトルが空の場合は投稿できないこと" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "本文が空の場合は投稿できないこと" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end

    it "画像が空の場合は投稿できないこと" do
      post = build(:post, image: nil)
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end
  end
end