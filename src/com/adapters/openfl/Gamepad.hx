package com.adapters.openfl;

import openfl.display.Stage;
import openfl.events.Event;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard as Key;

class Gamepad extends com.iainlobb.gamepad.Gamepad {

    var stage:Stage;

    public function new(stage:Stage, isCircle:Bool, ?ease:Float = 0.2) {
        super(isCircle, ease);

        if (stage == null) Lib.current.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        else onAddedToStage(null);
    }
    function onAddedToStage(e:Event) {
        if (e != null) Lib.current.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        stage = Lib.current.stage;

        stage.addEventListener(KeyboardEvent.KEY_DOWN, on_stage_keydown);
        stage.addEventListener(KeyboardEvent.KEY_UP, on_stage_keyup);
    }

    function on_stage_keydown(e:KeyboardEvent) onKeyDown(e.keyCode);
    function on_stage_keyup(e:KeyboardEvent) onKeyUp(e.keyCode);

    override function destroy() {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, on_stage_keydown);
        stage.removeEventListener(KeyboardEvent.KEY_UP, on_stage_keyup);
    }

    // DIRECTION
    override public function useArrows(?replaceExisting:Bool = false)
        mapDirection(Key.UP, Key.DOWN, Key.LEFT, Key.RIGHT, replaceExisting);
    override public function useWASD(?replaceExisting:Bool = false)
        mapDirection(Key.W, Key.S, Key.A, Key.D, replaceExisting);
    override public function useIJKL(?replaceExisting:Bool = false)
        mapDirection(Key.I, Key.K, Key.J, Key.L, replaceExisting);
    override public function useZQSD(?replaceExisting:Bool = false)
        mapDirection(Key.Z, Key.S, Key.Q, Key.D, replaceExisting);

    // FIRE
    override public function useGH(?replaceExisting:Bool = false)
        mapFireButtons(Key.G, Key.H, replaceExisting);
    override public function useZX(?replaceExisting:Bool = false)
        mapFireButtons(Key.Z, Key.X, replaceExisting);
    override public function useYX(?replaceExisting:Bool = false)
        mapFireButtons(Key.Y, Key.X, replaceExisting);
    override public function useControlSpace(?replaceExisting:Bool = false)
        mapFireButtons(Key.CONTROL, Key.SPACE, replaceExisting);
}