require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest # < ActionController::TestCase in Rails 4

  def setup
    @category = Category.create(name: "sport")
  end

  test "should get categories index" do
    get categories_path
    # get :index # in Rails 4
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    # get :new # in Rails 4
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    # get(:show, {'id' => @category.id}) # in Rails 4
    assert_response :success
  end
end
