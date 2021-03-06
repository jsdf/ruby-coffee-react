begin
  require 'minitest/autorun'
rescue LoadError
  require 'test/unit'
end

TestCase = if defined? Minitest::Test
    Minitest::Test
  elsif defined? MiniTest::Unit::TestCase
    MiniTest::Unit::TestCase
  else
    Test::Unit::TestCase
  end

if ENV['TEST_GEM']
  puts 'testing gem'
  require 'coffee-react'
else
  puts 'testing source'
  require 'coffee_react'
end
require 'stringio'

class TestCoffeeReact < TestCase
  def test_compile
    expected = File.open(example_file_path '/car.coffee').read
    actual = CoffeeReact.transform(File.open(example_file_path '/car.cjsx'))

    # debug_print expected, actual
    assert_match expected, actual
  end

  def test_jstransform
    expected = File.open(example_file_path '/car-jstransformed.js').read
    actual = CoffeeReact.jstransform(File.open(example_file_path '/car.js'))

    # debug_print expected, actual
    assert_match expected, actual
  end

  def test_compile_with_io
    io = StringIO.new('x = <table width={100} />')
    expected = 'x = React.createElement("table", {"width": (100)})'
    actual = CoffeeReact.transform(io)

    # debug_print expected, actual
    assert_match expected, actual
  end

  # def test_compilation_error
  #   error_messages = [
  #     # <=1.5
  #     "Error: Parse error on line 1: Unexpected 'POST_IF'",
  #     # 1.6
  #     "SyntaxError: unexpected POST_IF",
  #     # 1.7
  #     "[stdin]:1:1: error: unexpected unless\nunless\n^^^^^^"
  #   ]
  #   begin
  #     CoffeeReact.transform("unless")
  #     flunk
  #   rescue CoffeeReact::Error => e
  #     assert error_messages.include?(e.message),
  #       "message was #{e.message.inspect}"
  #   end
  # end
  
  def debug_print(expected, actual)
    puts "\n"
    puts '---'
    puts expected
    puts '---'
    puts actual
    puts '---'
    puts "\n"
  end

  def example_dir
    File.dirname __FILE__
  end

  def example_file_path(filename)
    File.join example_dir, filename
  end

  def assert_no_match(expected, actual)
    assert !expected.match(actual)
  end
end
