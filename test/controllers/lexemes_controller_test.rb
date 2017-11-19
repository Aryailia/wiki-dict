require 'test_helper'

class LexemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lexeme = lexemes(:one)
  end

  test "should get index" do
    get lexemes_url
    assert_response :success
  end

  test "should get new" do
    get new_lexeme_url
    assert_response :success
  end

  test "should create lexeme" do
    assert_difference('Lexeme.count') do
      post lexemes_url, params: { lexeme: { head: @lexeme.head } }
    end

    assert_redirected_to lexeme_url(Lexeme.last)
  end

  test "should show lexeme" do
    get lexeme_url(@lexeme)
    assert_response :success
  end

  test "should get edit" do
    get edit_lexeme_url(@lexeme)
    assert_response :success
  end

  test "should update lexeme" do
    patch lexeme_url(@lexeme), params: { lexeme: { head: @lexeme.head } }
    assert_redirected_to lexeme_url(@lexeme)
  end

  test "should destroy lexeme" do
    assert_difference('Lexeme.count', -1) do
      delete lexeme_url(@lexeme)
    end

    assert_redirected_to lexemes_url
  end
end
