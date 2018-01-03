// Agent anti_fire in project smartHomeModelV2

/* Initial beliefs and rules */

/* Initial goals */

!use.

/* Plans */

+?setup(AntiFire, FumeSensor):true<-
	makeArtifact("AntiFire","smartHomeModelV2.AntiFire",[], AntiFire)
	makeArtifact("FumeSensor","smartHomeModelV2.FumeSensor",[], FumeSensor)
	.

-?setup(AntiFire, FumeSensor):true<-	
	lookupArtifact("AntiFire", AntiFire);
	lookupArtifact("FumeSensor", FumeSensor).
	
	
+!use: true<-
	?setup(AntiFire, FumeSensor);
	start[artifact_id(FumeSensor)];
	focus(FumeSensor)
	.	
	
+detected(S):true<-
	lookupArtifact("AntiFire", AntiFire)
	.print("Signal fire: " ,S)
	open(M)[artifact_id(AntiFire)];
	.print(M).
	
+endfire(S):true<-
	lookupArtifact("AntiFire", AntiFire)
	.print("Signal fire: " ,S)
	close(M)[artifact_id(AntiFire)];
	.print(M).
	
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$jacamoJar/templates/org-obedient.asl") }
