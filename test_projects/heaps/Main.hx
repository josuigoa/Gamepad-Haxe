package;

class Main extends hxd.App {
     
    var gp:com.iainlobb.gamepad.Gamepad;

    override function init() {
        gp = new com.adapters.heaps.Gamepad(s2d, true);
        var v = new com.adapters.heaps.GamepadView(gp);
        v.x = hxd.System.width*.5;
        v.y = hxd.System.height*.5;

        s2d.addChild(v);
    }

    override function update(dt:Float) {
        gp.step();
        // trace('gamepad.x: ${gp.x}');
        // trace('gamepad.y: ${gp.y}');
        // trace('gamepad.rotation: ${gp.rotation}');
    }

    static function main() {
        new Main();
    }
}