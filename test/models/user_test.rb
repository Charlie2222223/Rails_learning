require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @department = Department.create(name: 'Test Department')
    @user = User.new(
      department_id: @department.id,
      name: 'Test User',
      ruby: 'てすとゆーざー',
      sex: 'male',
      tel: '1234567890',
      mobile: '0987654321',
      mail: 'testuser@example.com',
      zip: '123-4567',
      address1: 'Test Address 1',
      address2: 'Test Address 2',
      address3: 'Test Address 3',
      address4: 'Test Address 4',
      address5: 'Test Address 5',
      birthday: '1990-01-01'
    )
  end

  test "should save valid user" do
    assert @user.save
  end

  test "should not save user without name" do
    @user.name = nil
    assert_not @user.save
  end

  test "should not save user with invalid email" do
    @user.mail = 'invalid_email'
    assert_not @user.save
  end
end
