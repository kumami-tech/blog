require 'rails_helper'

describe "POST #create" do
  context "ユーザーを登録できる場合" do
    let(:params) { { user: attributes_for(:user) } }

    it "HTTPのレスポンスが302であること" do
      post user_registration_path, params: params
      expect(response.status).to eq 302
    end

    it "ユーザーが登録されること" do
      expect do
        post user_registration_path, params: params
      end.to change(User, :count).by(1)
    end

    it "トップページにリダイレクトすること" do
      post user_registration_path, params: params
      expect(response).to redirect_to root_path
    end
  end

  context "ユーザーを登録できない場合" do
    let(:invalid_params) { { user: attributes_for(:user, email: nil) } }

    it "HTTPのレスポンスが200であること" do
      post user_registration_path, params: invalid_params
      expect(response.status).to eq 200
    end

    it "ユーザーが登録されないこと" do
      expect do
        post user_registration_path, params: invalid_params
      end.to_not change(User, :count)
    end

    it "エラーが表示されること" do
      post user_registration_path, params: invalid_params
      expect(response.body).to include "を入力してください"
    end
  end
end
