#
# Test class for the method 'procedural_cube'
#
# Run with command:
#     ruby cube_specs.rb

require './cube'
require 'test/unit'
include Test::Unit::Assertions

class ProceduralCubeTest < Test::Unit::TestCase

    def test_cube_of_1
        assert 1 == procedural_cube(1)
    end

    def test_cube_of_2
        assert 8 == procedural_cube(2)
    end

    def test_cube_of_3
        assert 27 == procedural_cube(3)
    end

    def test_cube_of_4
        assert 64 == procedural_cube(4)
    end

    def test_from_1_to_100
        (1..100).each do |n|
            assert n**3 == procedural_cube(n)
        end
    end
    
end

class CubeTest < Test::Unit::TestCase

    def test_cube_of_1
        assert 1 == cube(1)
    end

    def test_cube_of_2
        assert 8 == cube(2)
    end

    def test_cube_of_3
        assert 27 == cube(3)
    end

    def test_cube_of_4
        assert 64 == cube(4)
    end

    def test_from_1_to_100
        (1..100).each do |n|
            assert n**3 == cube(n)
        end
    end
    
end