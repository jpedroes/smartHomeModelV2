// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import cartago.*;

public class AntiFire extends Artifact {
	private String state;
	
	@OPERATION
	void open( OpFeedbackParam<String> status){
		this.state = "isOpen";
		status.set(state);
	}
	
	@OPERATION
	void close(OpFeedbackParam<String> status) {
		this.state = "isClose";
		status.set(state);
	}
}

