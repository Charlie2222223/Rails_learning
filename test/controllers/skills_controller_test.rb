require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @skill = skills(:one)
  end

  test "should get index" do
    get skills_url
    assert_response :success
    assert_equal Skill.count, JSON.parse(@response.body).size
  end

  test "should show skill" do
    get skill_url(@skill)
    assert_response :success
    assert_equal @skill.name, JSON.parse(@response.body)["name"]
  end
end