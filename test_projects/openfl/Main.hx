package;

import openfl.events.Event;

class Main extends openfl.display.Sprite {
     
    var gp:com.iainlobb.gamepad.Gamepad;

    public function new() {
        super();

        gp = new com.adapters.openfl.Gamepad(stage, true);
        var v = new com.adapters.openfl.GamepadView(gp);
        v.x = stage.stageWidth*.5;
        v.y = stage.stageHeight*.5;
        
        addChild(v);
        
        if (stage != null) onAddedToStage(null);
        else addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    function onAddedToStage(e:Event) {
        if (e != null) removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    function onEnterFrame(_) {
        gp.step();
        // trace('gamepad.x: ${gp.x}');
        // trace('gamepad.y: ${gp.y}');
        // trace('gamepad.rotation: ${gp.rotation}');
    }
}