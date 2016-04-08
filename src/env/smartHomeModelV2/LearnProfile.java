// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import java.util.ArrayList;
import java.util.Random;

import cartago.*;

public class LearnProfile extends Artifact {

	private  String profile;
	
	private String plans;
	private int id = 0; 
	 
	@OPERATION
	void generatePlan(OpFeedbackParam<String> plan) {
		StringBuilder newPlan = new StringBuilder();
		this.id ++;
		String newId = ""+ this.id;
		plans = "sport" +newId+"(TV)";
		newPlan.append( "+!sport" +newId+ "(Tv):true<-openWithCc(10, 25, 5000,Status)[artifact_id(Tv)];.print(Status);.wait(5000);close(M);.print(M).");
		plan.set(newPlan.toString());
		
	}
	
	@OPERATION
	void planName(OpFeedbackParam<String> status){
		status.set(plans);
	}
	
	@OPERATION
	void profile(OpFeedbackParam<String> status){
		status.set(profile);
	}
	@OPERATION
	void start(){
		execInternalOp("run" );
	}
	@INTERNAL_OPERATION
	void run(){
		while(true){
			int i = new Random().nextInt(1);
			if(i == 0){
				profile = "economic";
				await_time(180000);
			}
			else{
				profile = "party";
				await_time(10000);
			}
		}
	}
	
	

	
}

