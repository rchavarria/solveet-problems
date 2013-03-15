#
# Screencast: solve Nicomachus cube numbers
#
# Problem description at: 
# http://www.solveet.com/exercises/Calculo-de-cubos-por-el-metodo-de-Nicomaco/75
#

require 'test/unit'
include Test::Unit::Assertions

def cube(n)
    return 1 if n == 1

    first_odd_position = (1..n-1).inject(:+)
    first_odd_number = first_odd_position * 2 + 1
    last_odd_number = first_odd_number + (n - 1) * 2
    (first_odd_number..last_odd_number).step(2).inject(:+)
end

class CubeTest < Test::Unit::TestCase

    def check(n)
        expected = n ** 3
        actual = cube(n)
        assert expected == actual, "cube of #{n} should be #{expected} but was #{actual}"
    end

    def test_from_1_to_1000
        (1..1000).each do |n|
            check(n)
        end
    end

end