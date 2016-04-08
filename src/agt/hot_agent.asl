// Agent hot_agent in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

!use.

+?setup(LearnTemperature, Split):true<-
	makeArtifact("LearnTemperature","smartHomeModelV2.LearnTemperature",[], LearnTemperature);
	makeArtifact("Split","smartHomeModelV2.Split",[], Split)
	.

-?setup(LearnTemperature, Split):true<-	
	lookupArtifact("LearnTemperature", LearnTemperature);
	lookupArtifact("Split", Split).
