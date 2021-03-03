require 'test_helper'

class SuggestedAlternativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suggested_alternative = suggested_alternatives(:one)
  end

  test "should get index" do
    get suggested_alternatives_url
    assert_response :success
  end

  test "should get new" do
    get new_suggested_alternative_url
    assert_response :success
  end

  test "should create suggested_alternative" do
    assert_difference('SuggestedAlternative.count') do
      post suggested_alternatives_url, params: { suggested_alternative: { description: @suggested_alternative.description, find: @suggested_alternative.find, imgUrl: @suggested_alternative.imgUrl, product_id: @suggested_alternative.product_id, source: @suggested_alternative.source, title: @suggested_alternative.title, whereToFind: @suggested_alternative.whereToFind } }
    end

    assert_redirected_to suggested_alternative_url(SuggestedAlternative.last)
  end

  test "should show suggested_alternative" do
    get suggested_alternative_url(@suggested_alternative)
    assert_response :success
  end

  test "should get edit" do
    get edit_suggested_alternative_url(@suggested_alternative)
    assert_response :success
  end

  test "should update suggested_alternative" do
    patch suggested_alternative_url(@suggested_alternative), params: { suggested_alternative: { description: @suggested_alternative.description, find: @suggested_alternative.find, imgUrl: @suggested_alternative.imgUrl, product_id: @suggested_alternative.product_id, source: @suggested_alternative.source, title: @suggested_alternative.title, whereToFind: @suggested_alternative.whereToFind } }
    assert_redirected_to suggested_alternative_url(@suggested_alternative)
  end

  test "should destroy suggested_alternative" do
    assert_difference('SuggestedAlternative.count', -1) do
      delete suggested_alternative_url(@suggested_alternative)
    end

    assert_redirected_to suggested_alternatives_url
  end
end
