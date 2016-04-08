// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import java.util.Random;

import cartago.*;

public class TemperatureSensor extends Artifact {
	
	@OPERATION
	void start(OpFeedbackParam<Integer> status){
		execInternalOp("run");
	}
	
		@INTERNAL_OPERATION void run() {
			while(true){
				signal("temperature", 19 + new Random().nextInt(7));
				await_time(2500);
			}
	}
}

