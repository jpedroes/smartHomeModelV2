// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import cartago.*;
import java.util.Random;

public class TemperatureSensor extends Artifact {
	
	@OPERATION
	void start(){
		execInternalOp("run");
	}
	
	@INTERNAL_OPERATION void run() {
		while(true){
			signal("temperature", 19 + new Random().nextInt(29));
			await_time(2500);
		}
	}
}