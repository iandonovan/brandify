require 'minitest/autorun'
require 'brandify'

class BrandifyTest < Minitest::Test
  def test_bio
    bio = Brandify.bio
    assert bio.is_a?(String)
    assert bio.length <= 160
  end

  def test_too_long_bio
    too_long = 100.times.map { |n| "brand" }
    shortened = Brandify.ensure_valid_length(too_long, 150)
    assert Brandify.join_results(shortened).length <= 150
  end

  def test_location
    loc = Brandify.location
    assert loc.is_a?(String)
    assert loc.length <= 30
  end

  def test_too_long_location
    too_long = 20.times.map { |n| "NYC" }
    shortened = Brandify.ensure_valid_length(too_long, 30)
    assert shortened.join(" ").length <= 30
  end

end
