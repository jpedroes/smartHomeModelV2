// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import java.util.Random;

import cartago.*;

public class FumeSensor extends Artifact {
private String s = "Detected";
	
	@OPERATION
	void start(){
		execInternalOp("run");
	}
	
	@INTERNAL_OPERATION void run() {
		while(true){
			await_time(2500);
				if( 9 > new Random().nextInt(10)){
					signal("detected", s);
					await_time(new Random().nextInt(5000));
					signal("endfire", "not" +s );
			}
		}
	}
}

