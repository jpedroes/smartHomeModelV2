// Agent light_agent in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

/* Initial beliefs and rules */

/* Initial goals */

/* Initial beliefs and rules */
night(T):- T>17 | T<6.

!use.
/* Initial goals */
+!use<-
	?setup(Light, PresenceSensor, ClockDate);
	//.wait(1000)
	.

+?setup( Tv, PresenceSensor, ClockDate):true<-
	makeArtifact("PresenceSensor","smartHomeModelV2.PresenceSensor",[], PresenceSensor);
	start[artifact_id(PresenceSensor)];
	lookupArtifact("ClockDate", ClockDate);
	focus(PresenceSensor)
	.
	
+detected(D) <- 
timeNow(T)[artifact_id(ClockDate)];
!openLight(T).

+isVoid(D) <- 
timeNow(T)[artifact_id(ClockDate)];
!closeLight(T).		

+!closeLight(T) <-
close(S)[artifact_id(Light)];
.print(T);
.print(S).

-!closeLight(T) <-
.print(T);
.print("detected, but its night")
.

+!openLight(T): night(T)<-
open(S)[artifact_id(Light)];
.print(T);
.print(S);.

-!openLight(T): not night<-
.print(T);
.print("detected, but its night")
.
