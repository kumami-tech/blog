require 'rails_helper'

describe "POST #create" do
  let(:user) { create(:user) }

  context "ログインできる場合" do
    let(:params) { { user: {email: user.email, password: user.password} } }

    it "HTTPのレスポンスが302であること" do
      post user_session_path, params: params
      expect(response.status).to eq 302
    end

    it "トップページにリダイレクトすること" do
      post user_session_path, params: params
      expect(response).to redirect_to root_path
    end
  end

  context "ログインできない場合" do
    let(:invalid_params) { { user: {email: user.email, password: "wrong_password"} } }

    it "HTTPのレスポンスが200であること" do
      post user_session_path, params: invalid_params
      expect(response.status).to eq 200
    end

    it "エラーが表示されること" do
      post user_session_path, params: invalid_params
      expect(response.body).to include "が違います"
    end
  end
end
