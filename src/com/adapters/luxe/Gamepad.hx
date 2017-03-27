package com.adapters.luxe;

import luxe.Input;

class Gamepad extends com.iainlobb.gamepad.Gamepad {

    public function new(isCircle:Bool, ?ease:Float = 0.2) {
        super(isCircle, ease);

        Luxe.on(luxe.Ev.keydown, on_luxe_keydown);
        Luxe.on(luxe.Ev.keyup, on_luxe_keyup);
    }

    function on_luxe_keydown(e:KeyEvent) onKeyDown(e.keycode);
    function on_luxe_keyup(e:KeyEvent) onKeyUp(e.keycode);

    override function destroy() {
        Luxe.off(luxe.Ev.keydown, on_luxe_keydown);
        Luxe.off(luxe.Ev.keyup, on_luxe_keyup);
    }

    // DIRECTION
    override public function useArrows(?replaceExisting:Bool = false)
        mapDirection(Key.up, Key.down, Key.left, Key.right, replaceExisting);
    override public function useWASD(?replaceExisting:Bool = false)
        mapDirection(Key.key_w, Key.key_s, Key.key_a, Key.key_d, replaceExisting);
    override public function useIJKL(?replaceExisting:Bool = false)
        mapDirection(Key.key_i, Key.key_k, Key.key_j, Key.key_l, replaceExisting);
    override public function useZQSD(?replaceExisting:Bool = false)
        mapDirection(Key.key_z, Key.key_s, Key.key_q, Key.key_d, replaceExisting);

    // FIRE
    override public function useGH(?replaceExisting:Bool = false)
        mapFireButtons(Key.key_g, Key.key_h, replaceExisting);
    override public function useZX(?replaceExisting:Bool = false)
        mapFireButtons(Key.key_z, Key.key_x, replaceExisting);
    override public function useYX(?replaceExisting:Bool = false)
        mapFireButtons(Key.key_y, Key.key_x, replaceExisting);
    override public function useControlSpace(?replaceExisting:Bool = false)
        mapFireButtons(Key.lctrl, Key.space, replaceExisting);
}