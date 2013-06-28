solveet caesar ciphering
========================

You can find the description of the problem and lots of published solutions at
[solveet](http://www.solveet.com/exercises/Cifrado-Cesar/145).

To run the test (it assumes that scalatest library is placed under `../lib`):

	del *.class
	scalac -cp ..\lib\scalatest_2.10-1.9.1.jar *.scala
	scala -cp ..\lib\scalatest_2.10-1.9.1.jar org.scalatest.tools.Runner -oWDS -R .

Or everything in a single line (windows):

	echo deleting... & del *.class & echo compiling... & scalac -cp ..\lib\scalatest_2.10-1.9.1.jar *.scala & echo running... & scala -cp ..\lib\scalatest_2.10-1.9.1.jar org.scalatest.tools.Runner -oWDS -R .

