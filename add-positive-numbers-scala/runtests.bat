echo off

echo Deleting class files
del *.class

echo Compiling .scala files
scalac -cp ..\lib\scalatest_2.10-1.9.1.jar *.scala

echo Running tests
scala -cp ..\lib\scalatest_2.10-1.9.1.jar org.scalatest.tools.Runner -oWDS

echo on