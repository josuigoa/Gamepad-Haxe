package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class GamepadDemo {

    var gp:com.iainlobb.gamepad.Gamepad;
	var gpview:com.adapters.kha.GamepadView;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		var gp = com.adapters.kha.Gamepad(true);
        gpv = new com.adapters.heaps.GamepadView(gp);
        gpv.x = kha.System.windowWidth*.5;
        gpv.y = kha.System.windowHeight*.5;
	}

	function update(): Void {}

	function render(framebuffer: Framebuffer): Void {
		var g = framebuffer.g2;
		g.begin();
		gpv.render(g);
		g.end();
	}
}
