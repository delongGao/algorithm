require 'pry' # for debug
require 'minitest/autorun' # for minitest runner
require 'minitest/benchmark' # for minitest benchmark
require 'minitest/pride'

class Box
  def initialize arr
    @array = arr
  end

  def do_brutal_force
    return nil, nil, 0 if @array.empty?

    max_sum = -Float::INFINITY
    left_sub = 0
    right_sub = 0
    # start index
    0.upto(@array.length - 1) {|i|
      # end index
      # NOTE: end index has to be equal or greater than the start index
      i.upto(@array.length - 1) { |j|
        cur_sum = @array[i..j].reduce(:+)
        if cur_sum > max_sum
          max_sum = cur_sum
          left_sub = i
          right_sub = j
        end
      }
    }
    return left_sub, right_sub, max_sum
  end

  def do_divide_n_conque
    
  end
end

class TestMaxSubarray < MiniTest::Unit::TestCase
  def setup
    @test_cases = [
        {
          :input => [],
          :expected => [nil,nil,0]
        },
        {
          :input => [100],
          :expected => [0,0,100]
        },
        {
          :input => [30, -28, 50],
          :expected => [0,2,52]
        },
        {
          :input => [1, 30, 45],
          :expected => [0,2,76]
        },
        {
          :input => [-1,-30,-45],
          :expected => [0,0,-1]
        }
      ]
  end

  def test_brutal_force
    @test_cases.each do |tc|
      obj = Box.new tc[:input]
      assert_equal obj.do_brutal_force, tc[:expected]
    end
  end
end