require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/spage1'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", spage2_path
  end
end