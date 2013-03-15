#
# Complete code and Unit Tests at 
#     https://github.com/rchavarria/solveet-problems/tree/master/nicomachus.rb
#

require 'test/unit'
include Test::Unit::Assertions

def procedural_cube(n)
    # ordinal of the first odd number to use
    ordinal = 0
    (0..n-1).each do |x|
        ordinal += x
    end

    # first odd number to use
    first = ordinal * 2 + 1

    sum = 0
    n.times do |x|
        sum += first
        first += 2
    end

    sum
end

def cube(n)
    # ordinal of the first odd number to use
    ordinal = (0..n-1).inject(0, :+)
    
    # first odd number to sum
    first = ordinal * 2 + 1
    # last odd number
    last = first + (n - 1) * 2

    # sum from first to last odd numbers
    (first..last).step(2).inject(:+)
end

# tests, run with 
# => ruby cube.rb
assert 1 == procedural_cube(1)
assert 8 == procedural_cube(2)
assert 27 == procedural_cube(3)
assert 64 == procedural_cube(4)

assert 1 == cube(1)
assert 8 == cube(2)
assert 27 == cube(3)
assert 64 == cube(4)
