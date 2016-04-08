// Agent cold_agent in project smartHomeModel

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

isClock(T):-
	T>26.

!use.

+?setup(LearnTemperature, Heater, Temperature):true<-
	makeArtifact("LearnTemperature","smartHomeModelV2.LearnTemperature",[], LearnTemperature);
	makeArtifact("Heater","smartHomeModelV2.Heater",[], Heater);
	makeArtifact("Temperature","smartHomeModelV2.Temperature",[], Temperature);
	.

-?setup(LearnTemperature, Heater, Temperature):true<-	
	lookupArtifact("LearnTemperature", LearnTemperature);
	lookupArtifact("Temperature", Temperature);
	lookupArtifact("Heater", Heater).

+!use: true<-
	?setup(LearnTemperature, Heater);
	!b(Heater);
	newValueForPlan(Value, Time)[artifact_id(LearnTermperature)];
	.remove_plan(b);
    .add_plan({@b	+!b(Heater):true<- start(Value, Time,Status)[artifact_id(Heater)]; .print(Status); .wait(Time); off(S); .print(S)}); !use.
		
@b		
+!b(Heater):true<-
		start(26, 1500,Status)[artifact_id(Heater)];
		.print(Status);
		.wait(1500);
		off(S);
		.print(S).		
			

	
		

