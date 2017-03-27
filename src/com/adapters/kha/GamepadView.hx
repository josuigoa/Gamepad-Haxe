package com.adapters.kha;

import kha.Color;
using kha.graphics2.GraphicsExtension;
import com.iainlobb.gamepad.Gamepad;

typedef Visual = {
    var x:Float;
    var y:Float;
    var r:Float;
    var w:Float;
    var h:Float;
    var colour:Color;
}

class GamepadView extends Sprite implements com.adapters.IGamepadView
{
    var background:Visual;
	var ball:Visual;
	var button1:Visual;
	var button2:Visual;
	var up:Visual;
	var down:Visual;
	var left:Visual;
	var right:Visual;
	var gamepad:Gamepad;
	var colour:Color;
	
	/**
	 * Visual representation of a Gamepad instance.
	 */
	public function new(_gamepad:Gamepad, _colour:UInt = 0x669900) 
	{
		super(null);
        background = new h2d.Graphics(this);
		
		gamepad = _gamepad;
        gamepad.view = this;
        colour = Color.fromValue(_colour);
		
		drawBackground();
		createBall();
		createButtons();
		createKeypad();
	}
	
	private function drawBackground():Void
	{
		if (gamepad.isCircle) drawCircle();
		else drawSquare();
	}
	
	private function drawSquare():Void
	{
        var c = new Color(colour.value);
        c.a = .2;
        background = {x:-50, y:-50, w:100, h:100, colour:c};
	}
	
	private function drawCircle():Void
	{
        var c = new Color(colour.value);
        c.a = .2;
        background = {x:0, y:0, r:50, colour:c};
	}
	
	private function createBall():Void
	{
        ball = {x:0, y:0, r:25, colour:new Color(colour.value)};
	}
	
	private function createKeypad():Void
	{
		up = createKey();
		up.x = -125;
		up.y = -15;
		
		down = createKey();
		down.x = -125;
		down.y = 20;
		
		left = createKey();
		left.x = -160;
		left.y = 20;
		
		right = createKey();
		right.x = -90;
		right.y = 20;
	}
	
	private function createButtons():Void
	{
		button1 = createButton();
		button1.x = 75;
		
		button2 = createButton();
		button2.x = 75;
		button2.y = 35;
	}
	
	private function createButton():Graphics
	{
        return {x:0, y:0, r:15, colour:new Color(colour.value)};
	}
	
	private function createKey():Graphics
	{
        return {x:0, y:0, w:30, h:30, colour:new Color(colour.value)};
	}
	
	public function update():Void
	{
		ball.x = gamepad.x * 25;
		ball.y = gamepad.y * 25;
		
		button1.color.a = gamepad.fire1.isDown ? 1 : 0.2;
		button2.color.a = gamepad.fire2.isDown ? 1 : 0.2;
		
		up.color.a = gamepad.up.isDown ? 1 : 0.2;
		down.color.a = gamepad.down.isDown ? 1 : 0.2;
		left.color.a = gamepad.left.isDown ? 1 : 0.2;
		right.color.a = gamepad.right.isDown ? 1 : 0.2;
	}
	
    public function render(g:kha.graphics2.Graphics) {
        drawVisual(g, background);
        drawVisual(g, button1);
        drawVisual(g, button2);
        drawVisual(g, up);
        drawVisual(g, down);
        drawVisual(g, left);
        drawVisual(g, right);
    }

    function drawVisual(g:kha.graphics2.Graphicx, v:Visual) {
        g.color = v.color;
        if (v.r == null) g.fillRect(v.x, v.y, v.w, v.h);
        else g.drawCircle(v.x, v.y, v.w, v.h);
    }
}