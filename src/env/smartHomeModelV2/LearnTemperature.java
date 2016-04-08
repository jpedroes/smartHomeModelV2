// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import java.util.Random;

import cartago.*;

public class LearnTemperature extends Artifact {
	
	@OPERATION
	void newValueForPlan( OpFeedbackParam<Integer> value,  OpFeedbackParam<Integer> time){
		value.set(18 + new Random().nextInt(45));
		time.set(1500 + new Random().nextInt(1500));
	}
	
}

