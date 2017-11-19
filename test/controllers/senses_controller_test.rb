require 'test_helper'

class SensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sense = senses(:one)
  end

  test "should get index" do
    get senses_url
    assert_response :success
  end

  test "should get new" do
    get new_sense_url
    assert_response :success
  end

  test "should create sense" do
    assert_difference('Sense.count') do
      post senses_url, params: { sense: { content: @sense.content, lexeme_id: @sense.lexeme_id, type: @sense.type } }
    end

    assert_redirected_to sense_url(Sense.last)
  end

  test "should show sense" do
    get sense_url(@sense)
    assert_response :success
  end

  test "should get edit" do
    get edit_sense_url(@sense)
    assert_response :success
  end

  test "should update sense" do
    patch sense_url(@sense), params: { sense: { content: @sense.content, lexeme_id: @sense.lexeme_id, type: @sense.type } }
    assert_redirected_to sense_url(@sense)
  end

  test "should destroy sense" do
    assert_difference('Sense.count', -1) do
      delete sense_url(@sense)
    end

    assert_redirected_to senses_url
  end
end
