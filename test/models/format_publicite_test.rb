# frozen_string_literal: true

require 'test_helper'

class FormatPubliciteTest < ActiveSupport::TestCase
  test 'when_all_then_return_all_format' do
    formats = FormatPublicite.all

    assert_not_nil formats
    assert_equal formats.length, FormatPublicite::FORMAT_NAME.length
  end

  test 'when_for_then_return_the_format_with_the_right_values' do
    format = FormatPublicite.for('banner')

    assert_equal format.nom, 'banner'
    assert_equal format.hauteur, 250
    assert_equal format.largeur, 970
  end
end
