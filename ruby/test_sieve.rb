require 'test/unit'

class TestIsPrime < Test::Unit::TestCase
  require './sieve'
  test "sieve" do
    assert_equal [2], sieve(2)
    assert_equal [2, 3], sieve(3)
    assert_equal [2, 3], sieve(4)
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23], sieve(25)
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23], sieve(23)
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], sieve(100)
    assert_equal 78498, sieve(1000000).length
  end

  test "is_prime" do
    assert_equal false, is_prime(0)
    assert_equal false, is_prime(1)
    assert_equal true,  is_prime(2)
    assert_equal true,  is_prime(3)
    assert_equal false, is_prime(4)
    assert_equal false, is_prime(25)
    assert_equal true,  is_prime(23)
    assert_equal true,  is_prime(99999999999973)
  end
end

