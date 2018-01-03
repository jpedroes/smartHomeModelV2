// Agent cold_agent in project smartHomeModel

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

temp(T):-
	T<22.

!use.

+?setup(Temperature, Heater):true<-
	makeArtifact("Temperature","smartHomeModelV2.TemperatureSensor",[], Temperature)
	makeArtifact("Heater","smartHomeModelV2.Heater",[], Heater)
	.

-?setup(Temperature, Heater):true<-	
	lookupArtifact("Temperature", Temperature);
	lookupArtifact("Heater", Heater).

+!use: true<-
	?setup(Temperature, Heater);
	start[artifact_id(Temperature)];
	focus(Temperature)
	.
		
+temperature(T):temp(T)<-
    lookupArtifact("Heater", Heater)
    .print("Temperature:",T)
	start(26, 1500,Status)[artifact_id(Heater)];
	.print(Status);
	.wait(1500);
	off(S);
	.print(S)
	.		
			

