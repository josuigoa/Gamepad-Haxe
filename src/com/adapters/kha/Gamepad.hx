package com.adapters.kha;

import kha.input.Keyboard;
import kha.Key;

@:enum
abstract KeyCode(Int) from Int to Int {
    var CTRL = 17;
    var UP = 38;
    var DOWN = 40;
    var LEFT = 37;
    var RIGHT = 39;
}

class Gamepad extends com.iainlobb.gamepad.Gamepad {

    public function new(isCircle:Bool, ?ease:Float = 0.2) {
        super(isCircle, ease);

	    Keyboard.get().notify(on_kha_keydown, on_kha_keyup);
        // useWASD(true);
        // useGH(true);
    }

    function on_kha_keydown(key:Key, char:String) {
        switch key {
            case Key.CHAR: onKeyDown(char.charCodeAt(0));
            case Key.UP: onKeyDown(KeyCode.UP);
            case Key.DOWN: onKeyDown(KeyCode.DOWN);
            case Key.LEFT: onKeyDown(KeyCode.LEFT);
            case Key.RIGHT: onKeyDown(KeyCode.RIGHT);
            case Key.CTRL: onKeyDown(KeyCode.CTRL);
            case _:
        }
    }

    function on_kha_keyup(key:Key, char:String) {
        switch key {
            case Key.CHAR: onKeyUp(char.charCodeAt(0));
            case Key.UP: onKeyUp(KeyCode.UP);
            case Key.DOWN: onKeyUp(KeyCode.DOWN);
            case Key.LEFT: onKeyUp(KeyCode.LEFT);
            case Key.RIGHT: onKeyUp(KeyCode.RIGHT);
            case Key.CTRL: onKeyUp(KeyCode.CTRL);
            case _:
        }
    }

    override function destroy() {
	    Keyboard.get().remove(on_kha_keydown, on_kha_keyup);
    }

    // DIRECTION
    override public function useArrows(?replaceExisting:Bool = false)
        mapDirection(KeyCode.UP, KeyCode.DOWN, KeyCode.LEFT, KeyCode.RIGHT, replaceExisting);
    override public function useWASD(?replaceExisting:Bool = false)
        mapDirection('w'.code, 's'.code, 'a'.code, 'd'.code, replaceExisting);
    override public function useIJKL(?replaceExisting:Bool = false)
        mapDirection('i'.code, 'k'.code, 'j'.code, 'l'.code, replaceExisting);
    override public function useZQSD(?replaceExisting:Bool = false)
        mapDirection('z'.code, 's'.code, 'q'.code, 'd'.code, replaceExisting);

    // FIRE
    override public function useGH(?replaceExisting:Bool = false)
        mapFireButtons('g'.code, 'h'.code, replaceExisting);
    override public function useZX(?replaceExisting:Bool = false)
        mapFireButtons('z'.code, 'x'.code, replaceExisting);
    override public function useYX(?replaceExisting:Bool = false)
        mapFireButtons('y'.code, 'x'.code, replaceExisting);
    override public function useControlSpace(?replaceExisting:Bool = false)
        mapFireButtons(KeyCode.CTRL, ' '.code, replaceExisting);
}