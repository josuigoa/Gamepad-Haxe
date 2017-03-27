package;

class Main extends luxe.Game {
     
    var gp:com.iainlobb.gamepad.Gamepad;

    override function ready() {
        gp = new com.adapters.luxe.Gamepad(true);
        var v = new com.adapters.luxe.GamepadView(gp);
        v.x = Luxe.screen.mid.x;
        v.y = Luxe.screen.mid.y;
    } //ready

    override function update(delta:Float) {
        gp.step();
        // trace('gamepad.x: ${gp.x}');
        // trace('gamepad.y: ${gp.y}');
        // trace('gamepad.rotation: ${gp.rotation}');
    }
}