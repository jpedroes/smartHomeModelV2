// CArtAgO artifact code for project smartHomeModelV2

package smartHomeModelV2;

import cartago.*;

public class Tv extends Artifact {
	private boolean state;
	private int channel;
	private int volume;
	private int time;
	private boolean Cc;
		
	@OPERATION
	void openWithCc(int channel, int volume, int time, OpFeedbackParam<String> status) {
		this.state = true;
		this.channel = channel;
		this.volume = volume;
		this.time = time;
		status.set("" + "Canal: " + this.channel +" Volume: "+ this.volume+" Tempo: "+this.time + "; Closed caption is active");
	}
	
	@OPERATION
	void open(int channel, int volume, int time, OpFeedbackParam<String> status) {
		this.state = true;
		this.channel = channel;
		this.volume = volume;
		this.time = time;
		status.set("" + "Canal: " + this.channel +" Volume: "+ this.volume+" Tempo: "+this.time);
	}
	
	@OPERATION
	void close(OpFeedbackParam<String> status) {
		this.state = false;
		status.set("Tv Desligada");
	}
}

