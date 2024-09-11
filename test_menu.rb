require 'minitest/autorun'
require_relative 'index'

class TestMenu < Minitest::Test
  def test_print_menu
    expected_output = <<~OUTPUT
      What would you like to do?
      1. Add new service credentials
      2. Retrieve an existing service credentials
      3. Print all credentials
      4. Exit
    OUTPUT

    assert_output(expected_output) do 
      print_menu()
    end
  end
end