name := "Spotify Best Before"

version := "1.0"

scalaVersion := "2.10.1"

libraryDependencies ++= Seq(
	"org.specs2" %% "specs2" % "2.0"
)

scalacOptions in Test ++= Seq("-Yrangepos")

resolvers ++= Seq("snapshots" at "http://oss.sonatype.org/content/repositories/snapshots",
                  "releases"  at "http://oss.sonatype.org/content/repositories/releases")
