// Agent manager in project smartHomeModelV2

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

/* Initial beliefs and rules */

!use.

/* Initial goals */

/* Plans */

+!use 
 <- ?setup(ClockDate, FaceDetection, LearnProfile);
!generateBroadcast.

+!generateBroadcast<-
	atHome(A)[artifact_id(FaceDetection)];
	profile(B)[artifact_id(LearnProfile)];
	.concat([A], [B], C);
	!sendBroadcast(C);
	.wait(30000);
	!generateBroadcast.	

+?setup(ClockDate, FaceDetection, LearnProfile):true <-
	makeArtifact("ClockDate", "smartHomeModelV2.ClockDate", [], ClockDate);
	makeArtifact("FaceDetection", "smartHomeModelV2.FaceDetection", [], FaceDetection);
	makeArtifact("LearnProfile", "smartHomeModelV2.LearnProfile", [], LearnProfile);
	focus(ClockDate);
	start[artifact_id(ClockDate)];
	start[artifact_id(LearnProfile)];
	timeNow(T)[artifact_id(ClockDate)]
	.

-?setup(ClockDate, FaceDetection, LearnProfile):true <-
lookupArtifact("ClockDate", ClockDate);
lookupArtifact("FaceDetection", FaceDetection);
lookupArtifact("LearnProfile", LearnProfile);
focus(ClockDate).

+today(D) <- 
	.print("Today is:",D).

+!sendBroadcast(T)<-
	//timeNow(NewTime)[artifact_id(ClockDate)];		//
	.print("enviando o broadcast:", T);
	.broadcast(tell, T).
//	.wait(2500);
//	!sendBroadcast(D).	

//>>>>>>>>>>>>permutando os perfis<<<<<<<<<<<<
+profile(P):true<-
.broadcast(tell, 2).

//recebendo plano de agente externo do agente visitante, (funciona mas não ficou na versão final de defesa)
//+!kqml_received(guest, tellHow, Plan, M):true
//<- .add_plan(Plan, guest);
//!star
//.

+!adapt:true<-  
?setup(ClockDate, FaceDetection, LearnProfile);
generatePlan(Z)[artifact_id( LearnProfile)];
planName(X)[artifact_id(LearnProfile)];
.print("O novo plano a ser implementado")
.send(tv, tell, Z);
.send(tv, achieve, sport1(TV));
.


+hour(T)<- .print("Hour:",T).
