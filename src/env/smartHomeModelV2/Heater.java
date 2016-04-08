// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import cartago.*;

public class Heater extends Artifact {
	private boolean state;
	private int value;
	private int time;
	

	@OPERATION
	void start( int value, int time, OpFeedbackParam<String> status) {
		this.state = true;
		this.value = value;
		this.time = time;
		status.set("Temperatura: "+ this.value + " Tempo de execução "+this.time);
	}
	
	@OPERATION
	void off(OpFeedbackParam<String> status) {
		this.state = false;
		status.set("Heater is off");
	}
	
}

