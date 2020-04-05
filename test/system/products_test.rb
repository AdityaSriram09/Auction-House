require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Contact", with: @product.contact
    fill_in "Current bid", with: @product.current_bid
    fill_in "Current bidder", with: @product.current_bidder
    fill_in "Deadline", with: @product.deadline
    fill_in "Description", with: @product.description
    fill_in "Image", with: @product.image
    fill_in "Name", with: @product.name
    check "Sold" if @product.sold
    fill_in "Start bid", with: @product.start_bid
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Contact", with: @product.contact
    fill_in "Current bid", with: @product.current_bid
    fill_in "Current bidder", with: @product.current_bidder
    fill_in "Deadline", with: @product.deadline
    fill_in "Description", with: @product.description
    fill_in "Image", with: @product.image
    fill_in "Name", with: @product.name
    check "Sold" if @product.sold
    fill_in "Start bid", with: @product.start_bid
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
