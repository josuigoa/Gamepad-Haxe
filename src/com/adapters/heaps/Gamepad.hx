package com.adapters.heaps;

import hxd.Key;

class Gamepad extends com.iainlobb.gamepad.Gamepad {

    var s2d:h2d.Scene;

    public function new(_s2d:h2d.Scene, isCircle:Bool, ?ease:Float = 0.2) {
        super(isCircle, ease);

        s2d = _s2d;

        s2d.addEventListener(on_s2d_event);
    }

    function on_s2d_event(e:hxd.Event) {
        switch e.kind {
            case hxd.Event.EventKind.EKeyDown: onKeyDown(e.keyCode);
            case hxd.Event.EventKind.EKeyUp: onKeyUp(e.keyCode);
            case _:
        }
    }

    override function destroy() {
        s2d.removeEventListener(on_s2d_event);
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
        mapFireButtons(Key.CTRL, Key.SPACE, replaceExisting);
}