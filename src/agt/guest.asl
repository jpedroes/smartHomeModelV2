// Agent sample_agent in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

/* Initial beliefs and rules */

/* Initial goals */

!send.

/* Plans */



+!send:true <-
.print("enviando...");
.concat("Artist: Arthur Wint, ", "album: Don't like you", D );
.send(manager, tellHow, "@star +!star : true <- .print(play_Arthur_Wint_album_Dont_like_you).");
.print("preferencias muciais enviadas").


