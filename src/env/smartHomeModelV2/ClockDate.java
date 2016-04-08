// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import cartago.*;

public class ClockDate extends Artifact {
	private  String day[]={"sun", "mon", "tue", "wed", "thu", "fri", "sat" };
	private String dayNow="";
	private int hourNow = 0;		
	
	@OPERATION
	void timeNow(OpFeedbackParam<Integer> status){
		status.set(hourNow);
	}
	
	@OPERATION
	void dayNow(OpFeedbackParam<String> status){
		status.set(dayNow);
	}

	
	@OPERATION
	void start(){
		execInternalOp("run");
	}
	
	@INTERNAL_OPERATION void run() {
		while(true){
			for(int d = 0; d<7; d++){
				dayNow = day[d];
				signal("today", day[d]);
				for(int h = 0; h<24; h++){
					hourNow = h;
					signal("hour", h);
					await_time(2500);
				}
			}
		}
	}

}

