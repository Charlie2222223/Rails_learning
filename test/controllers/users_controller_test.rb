require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # テスト用データのセットアップ
  setup do
    @user = users(:one)
  end

  # /users
  # GET ユーザー一覧取得
  test "should get index" do
    get users_url
    assert_response :success
    assert_not_nil assigns(:users)
    assert_includes @response.body, @user.name
  end

  # POST 新しいユーザー作成

  # /users/{user_id}
  # GET ユーザー詳細取得

  # PUT ユーザー更新

  # DELETE ユーザー削除
end
