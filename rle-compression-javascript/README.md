RLE compression (javascript)
============================

Solution to the solveet.com problem: [RLE compression](http://www.solveet.com/exercises/Compresion-RLE/35)

I managed to get a maven project to work with javascript thanks to [akquinet](http://blog.akquinet.de)
his blog post about [mavenizing a javascript project](http://blog.akquinet.de/2011/02/11/mavenizing-javascript-projects/)
and his wonderful maven archetype ([source on github](https://github.com/akquinet/javascript-archetypes))

The command to create the javascript project with the archetype is:

`mvn archetype:generate \
	
	-DarchetypeArtifactId=javascript-quickstart \
	
	-DarchetypeGroupId=de.akquinet.javascript.archetypes \
	
	-DarchetypeVersion=1.0.0 \
	
	-DgroupId=com.rchavarria.javascript \
	
	-DartifactId=rle-compression-javascript`

