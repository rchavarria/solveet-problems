from math import sqrt

def euclidean(x, y):
    return sqrt( sum( [ (xi - yi)**2 for xi, yi in zip(x, y) ] ) )

assert 2 == euclidean([1], [3])
assert 2 == euclidean([1, 1], [1, 3])
assert 2 == euclidean([1, 1, 1], [1, 1, 3])

assert 8 == euclidean([1, 2, 3, 4], [5, 6, 7, 8])
assert 2.83 == round(euclidean([2, 2], [4, 4]), 2)
assert 10.44 == round(euclidean([1, 5], [11, 2]), 2)

assert 5 == euclidean([2, 7], [5, 11])
assert 5 == euclidean([2, 7, 9], [5, 11, 9])

assert 5.57 == round(euclidean([3, 5, 2, 4], [1, 0, 3, 5]), 2)
assert 7.87 == round(euclidean([3, 5, 2, 4], [9, 10, 2, 5]), 2)
assert 12.85 == round(euclidean([1, 0, 3, 5 ], [9, 10, 2, 5]), 2)
