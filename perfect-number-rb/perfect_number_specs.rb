#
# Test class for the method 'procedural_cube'
#
# Run with command:
#     ruby cube_specs.rb

require './perfect_number_impl'
require 'test/unit'
include Test::Unit::Assertions

class PerfectNumberTest < Test::Unit::TestCase

    def test_five_is_not_perfect
        assert !is_perfect(5)
    end

    def test_six_is_perfect
        assert is_perfect(6)
    end

    def test_finding_8_should_return_6
        assert 6 == find(8)
    end

    def test_finding_10_should_return_6
        assert 6 == find(10)
    end

    def test_print_perfect_numbers_up_to_100
        perfects = 100.downto(1).collect do |n|
            find(n)
        end

        puts ""
        perfects.uniq.each do |p|
            puts p
        end
    end

end