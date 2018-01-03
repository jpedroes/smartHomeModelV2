// Agent hot_agent in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

temp(T):-
	T>26.

!use.

//aqui não foi usado o paadão setup por um bug que existe na ferramenta, 
//onde ou só cria os dois artefatos ou só busca, não há um meio termo...A temperatura já foi criada no cold_agent.
+!use: true<-
	makeArtifact("Split","smartHomeModelV2.Split",[], Split)
	lookupArtifact("Temperature", Temperature);
	focus(Temperature)
	.
		
+temperature(T):temp(T)<-
    lookupArtifact("Split", Split)
    .print("Temperature:",T)
	start(26, 1500,Status)[artifact_id(Split)];
	.print(Status);
	.wait(1500);
	off(S);
	.print(S)
	.		
			
