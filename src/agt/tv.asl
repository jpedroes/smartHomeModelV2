// Agent tv in project smartHomeModel

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

atHome("").

profile("economic").

!use.

+!kqml_received(manager, tell, Plan, M)
: .substring("+!",Plan )<- 
.add_plan(Plan);
.



+!kqml_received(manager, tell, T, M)<-
.nth(0,T,P);
.nth(1,T,Q);
-+atHome(P);
-+profile(Q);
.

+!use:true<-
	?setup(ClockDate, Tv)
	.
	
+?setup(ClockDate, Tv):true <-
	makeArtifact("Tv","smartHomeModelV2.Tv",[], Tv);
	lookupArtifact("ClockDate", ClockDate);
	focus(ClockDate).

-?setup(ClockDate, Tv):true <-
	lookupArtifact("Tv", Tv);
	lookupArtifact("ClockDate", ClockDate);
	focus(ClockDate).
	
+hour(D): atHome(Residents) & .substring("Father", Residents) & .substring("Mother", Residents) & .substring("Son", Residents)<-
timeNow(T)[artifact_id(ClockDate)];
//.print("caso 1");
!selectBehaviorF(D);
!selectBehaviorM(D);
!selectBehaviorS(D);
.print("Hour:",D);
.

+hour(D): atHome(Residents) &  .substring("Father", Residents) & .substring("Mother", Residents) & not .substring("Son", Residents)<-
//.print("caso 2");
!selectBehaviorF(D);
!selectBehaviorM(D);
.print("Hour:",D).

+hour(D) : atHome(Residents) &  .substring("Father", Residents) & .substring("Son", Residents) & not .substring("Mother", Residents)<-
//.print("caso 3");
!selectBehaviorF(D);
!selectBehaviorS(D);
.print("Hour:",D).

+hour(D) : atHome(Residents) &  .substring("Mother", Residents) & .substring("Son", Residents)  & not .substring("Father", Residents)<-
//.print("caso 4");
!selectBehaviorM(D);
!selectBehaviorS(D);
.print("Hour:",D).

+hour(D) : atHome(Residents) &  .substring("Father", Residents)  & not .substring("Mother", Residents) & not .substring("Son", Residents)<-
//.print("caso 5");
!selectBehaviorF(D);
.print("Hour:",D).

+hour(D) : atHome(Residents) &  .substring("Mother", Residents)   & not .substring("Father", Residents) & not .substring("Son", Residents)<-
//.print("caso 6");
!selectBehaviorM(D);
.print("Hour:",D).

+hour(D) : atHome(Residents) &  .substring("Son", Residents) &  not .substring("Father", Residents)  & not .substring("Mother", Residents)<-
//.print("caso 7");
!selectBehaviorS(D);
.print("Hour:",D).

+!selectBehaviorF(D):
	profile(P)  & P = "economic"<-
	dayNow(T)[artifact_id(ClockDate)];
	.print("planos para pai", D, P) ;	
	?activePlansFatherEconomic(D, T)
	.

+?activePlansFatherEconomic(D, T):T = "sun" & D = 16<-
	.print("hour", D);
	!sport(Tv).

+?activePlansFatherEconomic(D, T):T = "sun" & D = 20<-
	.print("hour", D);
	!serie(Tv)
	.

+?activePlansFatherEconomic(D, T):T = "wed" & D = 22<-
	.print("hour", D);
	!sport(Tv).

+?activePlansFatherEconomic(D, T):not T = "sat" & not T = "sun"  & D = 19<-
	.print("hour", D);
	!news(Tv).	

+?activePlansFatherEconomic(D, T):T = "fri" & D = 22<-
	.print("hour", D);
	!serie(Tv).

-?activePlansFatherEconomic(D, T)<-
	.print("hour", D).

@serieSun
+!serie(Tv):true					
	<-open(54, 50, 2500,Status)[artifact_id(Tv)];
		.print(Status);
		.wait(2500);
		close(M);
		.print(M).
	
@sport
+!sport(Tv):true
	<-open(26, 50, 5000,Status)[artifact_id(Tv)];
		.print(Status);
		.wait(5000);
		close(M);
		.print(M)
		.

@news
+!news(Tv):true					
	<-open(10, 50, 2500,Status)[artifact_id(Tv)];
		.print(Status);
		.wait(2500);
		close(M);
		.print(M)
		.		

-!selectBehaviorF(D):
	profile(P)  & P = "party"<- 
	dayNow(T)[artifact_id(ClockDate)];	
	.print("planos para pai", D, P);
	//?activePlansFatherParty(D, T)
	.
	
+!selectBehaviorM(D):
	profile(P)  & P = "economic"<-
	dayNow(T)[artifact_id(ClockDate)];
	.print("planos para mae:  ", D, P);
	?activePlansMotherEconomic(D, T).

	
+?activePlansMotherEconomic(D, T): not T = "sat" & not T = "sun"  & D = 21<- 
	.print("hour: ", D);
	!novel(Tv)
	.
	
+?activePlansMotherEconomic(D): not T = "sat" & not T = "sun"  & D = 19<- 
	.print("hour: ", D);
	!news(Tv)
	.			

-?activePlansMotherEconomic(D, T)<-
	.print("hour", D).

@novel
+!novel(Tv):true					
	<-open(10, 50, 2500,Status)[artifact_id(Tv)];
		.print(Status);
		.wait(2500);
		close(M);
		.print(M)
		.

-!selectBehaviorM(D):
	profile(P)  & P = "party"<- 	
	//!activePlansMotherParty(D).
	.print("planos para mae", D, P)
	.

+!selectBehaviorS(D):
profile(P)  & P = "economic"<- 	
	//!activePlansSonEconomic.
	.print("planos para filho", D, P)
	.
	
-!selectBehaviorS(D):
	profile(P)  & P = "party"<- 	
	//!activePlansSonrParty.
	.print("planos para filho", D, P)
	.	

+today(T) <- 
	.print("Today is:",T).
