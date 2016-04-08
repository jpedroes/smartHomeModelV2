// Agent deficient in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }



!send.


+!send:true <-
.print("hearing impaired: ask accessibility on TV.");
.send(manager, achieve, adapt).



