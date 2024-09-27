require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # テスト用データのセットアップ
  setup do
    @department = Department.create(name: 'test department') # テスト用部署を作成
    @user = users(:one) # fixturesからユーザーを取得(one)
  end

  # /users
  # GET ユーザー一覧取得
  test "should get index" do
    get users_url
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_includes json_response.map { |u| u['name'] }, @user.name
  end

  # POST 新しいユーザー作成
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: {
        department_id: @department.id,
        name: 'New User',
        ruby: 'にゅーゆーざー',
        sex: 'male',
        tel: '1234567890',
        mobile: '0987654321',
        mail: 'newuser@example.com',
        zip: '123-4567',
        address1: 'test',
        address2: 'test',
        address3: 'test',
        address4: 'test',
        address5: 'test',
        birthday: '1990-01-01'
      }}, as: :json
    end
    assert_response :created
    json_response = JSON.parse(@response.body)
    assert_equal @department.id, json_response['department_id']
    assert_equal 'New User', json_response['name']
    assert_equal 'にゅーゆーざー', json_response['ruby']
    assert_equal 'male', json_response['sex']
    assert_equal '1234567890', json_response['tel']
    assert_equal '0987654321', json_response['mobile']
    assert_equal 'newuser@example.com', json_response['mail']
    assert_equal '123-4567', json_response['zip']
    assert_equal 'test', json_response['address1']
    assert_equal 'test', json_response['address2']
    assert_equal 'test', json_response['address3']
    assert_equal 'test', json_response['address4']
    assert_equal 'test', json_response['address5']
    assert_equal '1990-01-01', json_response['birthday']
  end

  # /users/{user_id}
  # GET ユーザー詳細取得
  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal @user.id, json_response['id']
    assert_equal @user.department_id, json_response['department_id']
    assert_equal @user.name, json_response['name']
    assert_equal @user.ruby, json_response['ruby']
    assert_equal @user.sex, json_response['sex']
    assert_equal @user.tel, json_response['tel']
    assert_equal @user.mobile, json_response['mobile']
    assert_equal @user.mail, json_response['mail']
    assert_equal @user.zip, json_response['zip']
    assert_equal @user.address1, json_response['address1']
    assert_equal @user.address2, json_response['address2']
    assert_equal @user.address3, json_response['address3']
    assert_equal @user.address4, json_response['address4']
    assert_equal @user.address5, json_response['address5']
    assert_equal @user.birthday.strftime("%Y-%m-%d"), json_response['birthday']
  end

  # PUT ユーザー更新
  test "should update user" do
    updated_attributes = {
      department_id: @department.id,
      name: 'Updated User',
      ruby: 'アップデートユーザー',
      sex: 'female',
      tel: '0987654321',
      mobile: '1234567890',
      mail: 'updateduser@example.com',
      zip: '765-4321',
      address1: 'Updated Address 1',
      address2: 'Updated Address 2',
      address3: 'Updated Address 3',
      address4: 'Updated Address 4',
      address5: 'Updated Address 5',
      birthday: '1995-01-01'
    }

    put user_url(@user), params: {
      user: updated_attributes
    }, as: :json
    assert_response :success

    @user.reload

    json_response = JSON.parse(@response.body)
    assert_equal 'Updated User', json_response['name']
    assert_equal 'アップデートユーザー', json_response['ruby']
    assert_equal 'female', json_response['sex']
    assert_equal '0987654321', json_response['tel']
    assert_equal 'updateduser@example.com', json_response['mail']
    assert_equal '765-4321', json_response['zip']
    assert_equal 'Updated Address 1', json_response['address1']
    assert_equal 'Updated Address 2', json_response['address2']
    assert_equal 'Updated Address 3', json_response['address3']
    assert_equal 'Updated Address 4', json_response['address4']
    assert_equal 'Updated Address 5', json_response['address5']
    assert_equal '1995-01-01', json_response['birthday']
  end

  # DELETE ユーザー削除
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end
    assert_response :no_content
  end
end
