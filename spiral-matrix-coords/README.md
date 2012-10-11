Route without loops
===================

Solution to the solveet.com problem: [Spiral matrix coords](http://www.solveet.com/exercises/Coordenadas-de-un-numero-en-una-matriz-caracol-/51)

Run tests with the command:
	mvn clean test

A little background to explain the solution
-------------------------------------------

Given the following matrix:

 1  2  3  4  5
15 16 17 18  6
14 23 24 19  7
13 22 21 20  8
11 12 11 10  9

There are three 'rings':

 1  2  3  4  5     .  .  .  .  .     .  .  .  .  .
15  .  .  .  6     . 16 17 18  .     .  .  .  .  .
14  .  .  .  7     . 23  . 19  .     .  . 24  .  .
13  .  .  .  8     . 22 21 20  .     .  .  .  .  .
11 12 11 10  9     .  .  .  .  .     .  .  .  .  .

The 'startingPoint' or 'diagonalValue' of each ring is the lower number withing the ring:
* 1 for the ring #1
* 16 for the ring #2
* 24 for the ring #3

And 'lateralLenght' is the number of digits in each ring side less one, to avoid repetition
of position. So, for the ring #2, the lateralLength=2 and the four laterals are composed 
of these numbers:
* 16, 17
* 18, 19
* 20, 21
* 22, 23
