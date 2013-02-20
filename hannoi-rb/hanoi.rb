#
# Complete code at https://github.com/rchavarria/solveet-problems/tree/master/hannoi/hanoi.rb
#

def hanoi(ring, origin, aux, target)
    return if ring == 0

    hanoi(ring - 1, origin, target, aux)
    puts "Move ring (" + ring.to_s + "): " + origin + " -> " + target
    hanoi(ring - 1, aux, origin, target)
end

# example of use
hanoi(4, "[T1]", "[T2]", "[T3]")
