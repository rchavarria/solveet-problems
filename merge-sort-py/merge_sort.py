#
#   solution to 'merge sort' problem in python
#
def merge_sort(numbers):
	"""Entry point of the algorithm"""
	n = len(numbers)
	if(n == 1): return numbers

	left = merge_sort(numbers[:(n/2)])
	right = merge_sort(numbers[(n/2):])

	return merge(left, right)

def merge(left, right):
	"The most complicated method, it merges two arrays of sorted integers"""
	result = []
	i = 0
	j = 0
	len_left = len(left)
	len_right = len(right)

	while(i < len_left or j < len_right):
		if(i >= len_left):
			result.append(right[j])
			j = j + 1
		elif(j >= len_right):
			result.append(left[i])
			i = i + 1
		elif(left[i] < right[j]):
			result.append(left[i])
			i = i + 1
		else:
			result.append(right[j])
			j = j + 1

	return result

def test(expected, actual):
	sort = merge_sort(actual)
	assert expected == sort
	print actual, "is sort as", sort

test([1], [1])
test([1, 2], [2, 1])
test([1, 2, 3], [2, 3, 1])
test([1, 2, 3, 4], [2, 3, 1, 4])
test([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [10, 6, 2, 3, 5, 1, 7, 4, 9, 8])
