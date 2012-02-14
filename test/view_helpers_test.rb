require 'test/unit'
require 'action_view'
require 'entitlement/view_helpers'


class View
  include Entitlement::ViewHelpers
end


class ViewHelpersTest < Test::Unit::TestCase

  def setup
    @view = View.new
  end

  #
  # tee
  #

  def test_tee_with_one_argument
    out = @view.tee 'My page'
    assert_equal 'My page', out
  end

  def test_tee_with_two_arguments
    out = @view.tee 'My page', 'Some section'
    assert_equal 'My page', out
  end

  def test_tee_is_html_safe
    out = @view.tee 'My page'
    assert out.html_safe?
  end

  #
  # title as tee
  #

  def test_title_as_tee_alias_with_one_argument
    out = @view.title 'My page'
    assert_equal out, 'My page'
  end

  def test_title_as_tee_alias_with_two_arguments
    out = @view.title 'My page', 'Some section'
    assert_equal 'My page', out
  end

  def test_title_as_tee_alias_is_html_safe
    out = @view.title 'My page'
    assert out.html_safe?
  end

  #
  # title rendering
  #

  def test_title_without_arguments
    @view.tee 'My page'
    out = @view.title
    assert_equal 'My page', out
  end

  def test_title_without_arguments_via_title
    @view.title 'My page'
    out = @view.title
    assert_equal 'My page', out
  end

  def test_title_with_site
    @view.tee 'My page'
    out = @view.title :site => 'My site'
    assert_equal 'My page - My site', out
  end

  def test_title_with_site_via_title
    @view.title 'My page'
    out = @view.title :site => 'My site'
    assert_equal 'My page - My site', out
  end

  def test_title_with_sections
    @view.tee 'My page', 'Some section'
    out = @view.title
    assert_equal 'My page - Some section', out
  end

  def test_title_with_sections_via_title
    @view.title 'My page', 'Some section'
    out = @view.title
    assert_equal 'My page - Some section', out
  end

  def test_title_with_site_and_sections
    @view.tee 'My page', 'Some section'
    out = @view.title :site => 'My site'
    assert_equal 'My page - Some section - My site', out
  end

  def test_title_with_site_and_sections_via_title
    @view.title 'My page', 'Some section'
    out = @view.title :site => 'My site'
    assert_equal 'My page - Some section - My site', out
  end

  def test_title_with_custom_separator
    @view.tee 'My page'
    out = @view.title :site => 'My site', :separator => ': '
    assert_equal 'My page: My site', out
  end

  def test_title_with_custom_separator_via_title
    @view.title 'My page'
    out = @view.title :site => 'My site', :separator => ': '
    assert_equal 'My page: My site', out
  end

  def test_title_big_endian
    @view.tee 'My page', 'Some section'
    out = @view.title :site => 'My site', :big_endian => true
    assert_equal 'My site - Some section - My page', out
  end

  def test_title_big_endian_via_title
    @view.title 'My page', 'Some section'
    out = @view.title :site => 'My site', :big_endian => true
    assert_equal 'My site - Some section - My page', out
  end

  def test_title_is_html_safe
    @view.tee 'My page'
    out = @view.title
    assert out.html_safe?
  end

  def test_title_is_html_safe_via_title
    @view.title 'My page'
    out = @view.title
    assert out.html_safe?
  end

end
