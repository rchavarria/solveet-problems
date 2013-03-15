#
# Complete code and Unit Tests at 
#     https://github.com/rchavarria/solveet-problems/tree/master/perfect-number-rb
#

def is_perfect(n) 
    divisors = (1..n-1).select { |i| n % i == 0 }
    n == divisors.inject(:+)
end

def find(n) 
    first_perfect = n.downto(1).find { |i| is_perfect(i) }
    return 0 if !first_perfect
    first_perfect
end

# call this method to play with it
def play
        puts "Give me a limit"
        limit = gets.chomp.to_i
        perfects = limit.downto(1).collect do |n|
            find(n)
        end

        puts ""
        perfects.uniq.each do |p|
            puts p
        end
end
