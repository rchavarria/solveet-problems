RLE compression
===============

Solution to the solveet.com problem: [Russian olimpics](http://www.solveet.com/exercises/Problema-de-las-Olimpiadas-rusas/38)

I developed two methods:
1 Brute force: the program generates a string appending each number until the string's length is greater than the provided number, then it returns the nth index
2 Counting the number of digits, and return the proper index within the previous number which digits were taking into account (look at the code better)
