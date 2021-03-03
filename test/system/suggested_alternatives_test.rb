require "application_system_test_case"

class SuggestedAlternativesTest < ApplicationSystemTestCase
  setup do
    @suggested_alternative = suggested_alternatives(:one)
  end

  test "visiting the index" do
    visit suggested_alternatives_url
    assert_selector "h1", text: "Suggested Alternatives"
  end

  test "creating a Suggested alternative" do
    visit suggested_alternatives_url
    click_on "New Suggested Alternative"

    fill_in "Description", with: @suggested_alternative.description
    fill_in "Find", with: @suggested_alternative.find
    fill_in "Imgurl", with: @suggested_alternative.imgUrl
    fill_in "Product", with: @suggested_alternative.product_id
    fill_in "Source", with: @suggested_alternative.source
    fill_in "Title", with: @suggested_alternative.title
    fill_in "Wheretofind", with: @suggested_alternative.whereToFind
    click_on "Create Suggested alternative"

    assert_text "Suggested alternative was successfully created"
    click_on "Back"
  end

  test "updating a Suggested alternative" do
    visit suggested_alternatives_url
    click_on "Edit", match: :first

    fill_in "Description", with: @suggested_alternative.description
    fill_in "Find", with: @suggested_alternative.find
    fill_in "Imgurl", with: @suggested_alternative.imgUrl
    fill_in "Product", with: @suggested_alternative.product_id
    fill_in "Source", with: @suggested_alternative.source
    fill_in "Title", with: @suggested_alternative.title
    fill_in "Wheretofind", with: @suggested_alternative.whereToFind
    click_on "Update Suggested alternative"

    assert_text "Suggested alternative was successfully updated"
    click_on "Back"
  end

  test "destroying a Suggested alternative" do
    visit suggested_alternatives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Suggested alternative was successfully destroyed"
  end
end
