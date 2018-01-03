// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import java.util.Random;

import cartago.Artifact;
import cartago.INTERNAL_OPERATION;
import cartago.OPERATION;
import cartago.OpFeedbackParam;

public class FaceDetection extends Artifact {
	
	private String s = "Strange Detected";

	@OPERATION
	void atHome(OpFeedbackParam<String> status){
		int i = new Random().nextInt(7)	;
		if(i == 0){
			status.set("Father");
		}
		else if(i ==1){
			status.set("Mother");
		}
		
		else if(i ==2){
			status.set("Son");
		}
		
		else if(i ==3){
			status.set("Father, Mother");
		}
		
		else if(i ==4){
			status.set("Father, Son");
		}
		
		else if(i ==5){
			status.set("Mother, Son");
		}
		
		else if(i == 6){
			status.set("Father, Mother, Son");
		}
				
	}
	
	
	@OPERATION
	void startStrange(){
		execInternalOp("run");
	}
	
	@INTERNAL_OPERATION void run() {
		while(true){
			await_time(2500);
				if( 4 > new Random().nextInt(10)){
					signal("detected", s);
			}
		}
	}
}