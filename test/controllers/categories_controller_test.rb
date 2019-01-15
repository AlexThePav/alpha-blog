require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest # < ActionController::TestCase in Rails 4

  def setup
    @category = Category.create(name: "sport")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end

  test "should get categories index" do
    get categories_path
    # get :index # in Rails 4
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    # session[:user_id] = @user.id # in Rails 4
    get new_category_path
    # get :new # in Rails 4
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    # get(:show, {'id' => @category.id}) # in Rails 4
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: "sports"}}
      # post :create, category: { name: "sports"} # in Rails 4
    end
    assert_redirected_to categories_path
  end
end
