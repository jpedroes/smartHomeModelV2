// Agent music_agent in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

/* Initial beliefs and rules */

/* Initial goals */



/* Plans */

+!start : true <- .print("hello world.").

+!kqml_received(manager, tell, T, M)<-
.nth(0,T,P);
.nth(1,T,Q);
-+atHome(P);
.print(P);
-+profile(Q);
.print(Q).
