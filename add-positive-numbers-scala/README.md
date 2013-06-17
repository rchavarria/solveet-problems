solveet-add-positive-numbers
============================

Solution to the solveet.com problem: [Add positive numbers](http://www.solveet.com/exercises/Suma-Positivos/25)
written in the Scala language.

The original problem is called `sizecon` and can be found in [spoj](http://www.spoj.pl/problems/SIZECON/)

To run the test (it assumes that scalatest library is placed under `../lib`):

	del *.class
	scalac -cp ..\lib\scalatest_2.10-1.9.1.jar *.scala
	scala -cp ..\lib\scalatest_2.10-1.9.1.jar org.scalatest.tools.Runner -oWDS -R .

