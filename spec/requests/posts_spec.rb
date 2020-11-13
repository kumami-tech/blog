require "rails_helper"

RSpec.describe PostsController, type: :request do
  let(:user) { create(:user) }
  let(:new_post) { create(:post, user: user) }

  describe "GET #index" do
    let(:posts) { create_list(:post, 3) }
    
    it "HTTPのレスポンスが200であること" do
      get posts_path
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #show" do
    it "HTTPのレスポンスが200であること" do
      get post_path new_post.id
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #new" do
    context "ユーザーがログインしている場合" do
      it "HTTPのレスポンスが200であること" do
        sign_in user
        get new_post_path
        expect(response).to have_http_status "200"
      end
    end

    context "ユーザーがログインしていない場合" do
      it "HTTPのレスポンスが302であること" do
        get new_post_path
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "POST #create" do
    let(:params) { { post: attributes_for(:post) } }

    context "ユーザーがログインしている場合" do
      before do
        sign_in user
      end

      it "HTTPのレスポンスが200であること" do
        get new_post_path, params: params
        expect(response).to have_http_status "200"
      end

      it "投稿が保存されること" do
        expect do
          post posts_path, params: params
        end.to change(Post, :count).by(1)
      end

      it "投稿詳細ページにリダイレクトすること" do
        post posts_path, params: params
        expect(response).to redirect_to post_path(Post.last)
      end
    end

    context "ユーザーがログインしていない場合" do
      it "HTTPのレスポンスが302であること" do
        post posts_path
        expect(response).to have_http_status "302"
      end

      it "投稿が保存されないこと" do
        expect do
          post posts_path, params: params
        end.to_not change(Post, :count)
      end
    end
  end
  
  describe "GET #edit" do
    context "ユーザーがログインしている場合" do
      it "HTTPのレスポンスが200であること" do
        sign_in user
        get edit_post_path new_post.id
        expect(response).to have_http_status "200"
      end
    end

    context "ユーザーがログインしていない場合" do
      it "HTTPのレスポンスが302であること" do
        get edit_post_path new_post.id
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "PATCH #update" do
    let(:params) { { post: attributes_for(:post) } }

    context "ユーザーがログインしている場合" do
      before do
        sign_in user
      end

      # it "HTTPのレスポンスが200であること" do
      #   patch post_path new_post.id
      #   expect(response).to have_http_status "200"
      # end

      # it "投稿詳細ページにリダイレクトすること" do
      #   patch post_path new_post.id
      #   expect(response).to redirect_to post_path(new_post)
      # end
    end

    context "ユーザーがログインしていない場合" do
      it "HTTPのレスポンスが302であること" do
        patch post_path new_post.id
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "DELETE #destroy" do
    context "ユーザーがログインしている場合" do
      before do
        sign_in user
      end

      # it "HTTPのレスポンスが200であること" do
      #   delete post_path new_post.id
      #   expect(response).to have_http_status "200"
      # end

      # it '投稿が削除されること' do
      #   expect do
      #     delete post_path new_post.id
      #   end.to change(User, :count).by(-1)
      # end

      it "投稿詳細ページにリダイレクトすること" do
        delete post_path new_post.id
        expect(response).to redirect_to root_path
      end
    end

    # context "ユーザーがログインしていない場合" do
    #   it "HTTPのレスポンスが302であること" do
    #     delete post_path new_post.id
    #     expect(response).to have_http_status "302"
    #   end
    # end
  end
end