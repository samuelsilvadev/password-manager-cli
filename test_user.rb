require 'minitest/autorun'
require 'stringio'
require_relative './user.rb'

class UserIndex < Minitest::Test
  def test_valid_username
    output = capture_io do
      result = verify_username?("admin")
      assert result
    end

    assert_equal "Valid username ✅\n", output[0]
  end

  def test_invalid_username
    output = capture_io do
      result = verify_username?("Admin")
      assert !result
    end

    assert_equal "Invalid username 🚫\n", output[0]
  end

  def test_empty_username
    output = capture_io do
      result = verify_username?("")
      assert !result
    end

    assert_equal "Username can't be empty\n", output[0]
  end

  def test_nil_username
    output = capture_io do
      result = verify_username?(nil)
      assert !result
    end

    assert_equal "Username can't be empty\n", output[0]
  end

  def test_valid_password
    output = capture_io do
      result = verify_password?("123456")
      assert result
    end

    assert_equal "Valid password ✅\n", output[0]
  end

  def test_invalid_password
    output = capture_io do
      result = verify_password?("123456789")
      assert !result
    end

    assert_equal "Invalid password 🚫\n", output[0]
  end

  def test_empty_password
    output = capture_io do
      result = verify_password?("")
      assert !result
    end

    assert_equal "Password can't be empty\n", output[0]
  end

  def test_nil_password
    output = capture_io do
      result = verify_password?(nil)
      assert !result
    end

    assert_equal "Password can't be empty\n", output[0]
  end
end
