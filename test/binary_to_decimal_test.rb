require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/binary_to_decimal'

describe "binary to decimal" do
  it "From 10011001 to 153" do
    binary_array = [1, 0, 0, 1, 1, 0, 0, 1]
    expected_decimal = 153
    
    binary_to_decimal(binary_array).must_equal expected_decimal
  end
  
  it "From 00001101 to 13" do
    binary_array = [0, 0, 0, 0, 1, 1, 0, 1]
    expected_decimal = 13
    
    binary_to_decimal(binary_array).must_equal expected_decimal
  end
  
  it "From 10000000 to 128" do
    binary_array = [1, 0, 0, 0, 0, 0, 0, 0]
    expected_decimal = 128
    
    binary_to_decimal(binary_array).must_equal expected_decimal
  end
  
  it "From random binary to decimal" do
    binary_array = Array.new(8) { rand(0..1) }
    expected_decimal = binary_array.join.to_s.to_i(2)
    
    binary_to_decimal(binary_array).must_equal expected_decimal
  end
  
  # checks that the array being passed in has only valid inputs
  it "verifies that only valid values are accepted in the argumentative array" do
    invalid_array = [2,1,1,1,0,0,0,0]
    expect {
      binary_to_decimal(invalid_array)
    }.must_raise ArgumentError
    
  end
  
  # it "will not accept an array of an invalid length" do
  it "verifies the length of the array" do
    invalid_array = [0,1,1,0]
    expect {
      binary_to_decimal(invalid_array)
    }.must_raise ArgumentError
  end
  
end
