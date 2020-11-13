describe 'POST #create' do
  let(:user) { create(:user) }
  let(:new_post) { create(:post, user: user) }
  let(:comment) { create(:comment, post: new_post) }
  let(:params) { { post_id: new_post.id, comment: attributes_for(:comment) } }
  let(:invalid_params) { { post_id: new_post.id, comment: attributes_for(:comment, content: nill) } }

  context "投稿が保存できる場合" do
    it "HTTPのレスポンスが200であること" do
      post post_comments_path, params: params, xhr: true
      expect(response).to have_http_status "200"
    end
    it "コメントが非同期で保存されること" do
      expect do
        post post_comments_path, params: params, xhr: true
      end.to change(Comment, :count).by(1)
    end
  end

  context "投稿が保存できない場合" do
    it "HTTPのレスポンスが302であること" do
      post post_comments_path, params: invalid_params, xhr: true
      expect(response).to have_http_status "302"
    end
    it "コメントが非同期で保存されること" do
      expect do
        post post_comments_path, params: invalid_params, xhr: true
      end.to_not change(User, :count)
    end
  end
end