// Agent strange_detect in project smartHomeModelV2

/* Initial beliefs and rules */

/* Initial goals */

!use.

/* Plans */

+!use: true<-
	.wait(4000)
	lookupArtifact("FaceDetection", FaceDetection);
	startStrange[artifact_id(FaceDetection)];
	focus(FaceDetection)
	.	

+detected(S): true <-
	.print(S);
	.print("Send alert for Mother and Father");
	.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$jacamoJar/templates/org-obedient.asl") }
