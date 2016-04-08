// Agent tv in project smartHomeModel

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

atHome("").

profile("economic").

!use.


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
	
+hour(D)<-
timeNow(T)[artifact_id(ClockDate)];
!selectBehavior(D);
.

+!selectBehavior(D):true	<-
	dayNow(T)[artifact_id(ClockDate)];
	?activePlans(D, T)
	.

+?activePlans(D, T):atHome(Residents) & profile(P) &  .substring("Father", Residents)   & P = "economic" & T = "sun" & D = 16<-
	.print("hour", D);
	!sport(Tv).

+?activePlans(D, T): atHome(Residents) & profile(P) &  .substring("Father", Residents)   & P = "economic" &T = "sun" & D = 20<-
	.print("hour", D);
	!serie(Tv)
	.

+?activePlans(D, T): atHome(Residents) & profile(P) &  .substring("Father", Residents)   & P = "economic" & T = "wed" & D = 22<-
	.print("hour", D);
	!sport(Tv).

+?activePlans(D, T): atHome(Residents) & profile(P) &  .substring("Father", Residents)   & P = "economic" & not T = "sat" & not T = "sun"  & D = 19<-
	.print("hour", D);
	!news(Tv).	

+?activePlans(D, T): atHome(Residents) & profile(P) &  .substring("Father", Residents)   & P = "economic" & T = "fri" & D = 22<-
	.print("hour", D);
	!serie(Tv).

-?activePlans(D, T)<-
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
	
+?activePlans(D, T): atHome(Residents) & profile(P) &  .substring("Mother" , Residents)   & P = "economic" & not T = "sat" & not T = "sun"  & D = 21<- 
	.print("hour: ", D);
	!novel(Tv)
	.
	
+?activePlans(D, T): atHome(Residents) & profile(P) &  .substring("Mother" , Residents)   & P = "economic" &  not T = "sat" & not T = "sun"  & D = 19<- 
	.print("hour: ", D);
	!news(Tv)
	.			

-?activePlans(D, T)<-
	.print("hour", D).

@novel
+!novel(Tv):true					
	<-open(10, 50, 2500,Status)[artifact_id(Tv)];
		.print(Status);
		.wait(2500);
		close(M);
		.print(M)
		.

//+?selectBehavior(D):
//	atHome(Residents) & profile(P) &  .substring("Mother", Residents)  & P = "party"<- 	
//	//!activePlansMotherParty(D).
//	.print("planos para mae", D, P)
//	.

//+?selectBehavior(D):
//atHome(Residents) & profile(P) &  .substring("Son", Residents) & P = "economic"<- 	
//	//!activePlansSonEconomic.
//	.print("planos para filho", D, P)
//	.
	
//+!selectBehavior(D):
//	atHome(Residents) & profile(P) &  .substring("Son", Residents)     & P = "party"<- 	
//	//!activePlansSonrParty.
//	.print("planos para filho", D, P)
//	.

//-?selectBehavior(D)<- 	
//	.wait(2500);
//	?selectBehavior
//	.		

+today(T) <- 
	.print("Today is:",T).
