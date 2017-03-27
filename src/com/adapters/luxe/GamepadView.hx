package com.adapters.luxe;

import luxe.Visual;
import luxe.Vector;
import luxe.Color;
import com.iainlobb.gamepad.Gamepad;

class GamepadView implements com.adapters.IGamepadView
{
	var parent:luxe.Entity;	

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

	public var x(default, set):Float;
	public var y(default, set):Float;
	
	/**
	 * Visual representation of a Gamepad instance.
	 */
	public function new(_gamepad:Gamepad, _colour:UInt = 0x669900) 
	{
		parent = new luxe.Entity({name:'gamepadview'});
        
		gamepad = _gamepad;
        gamepad.view = this;
		colour = new Color().rgb(_colour);
		
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
        background = new Visual({
			name : 'background',
			color : new Color(colour.r, colour.g, colour.b, .2),
			size : new Vector(100, 100),
			pos : new Vector(-50, -50),
			parent : parent
		});
	}
	
	private function drawCircle():Void
	{
        background = new Visual({
			name : 'background',
			color : new Color(colour.r, colour.g, colour.b, .2),
			geometry : Luxe.draw.circle({x:0, y:0, r:50}),
			parent : parent
		});
	}
	
	private function createBall():Void
	{
		ball = new Visual({
			name : 'ball',
			color : colour.clone(),
			geometry : Luxe.draw.circle({x:0, y:0, r:25}),
			parent : parent
		});
	}
	
	private function createKeypad():Void
	{
		up = createKey();
		up.pos.x = -125;
		up.pos.y = -15;
		
		down = createKey();
		down.pos.x = -125;
		down.pos.y = 20;
		
		left = createKey();
		left.pos.x = -160;
		left.pos.y = 20;
		
		right = createKey();
		right.pos.x = -90;
		right.pos.y = 20;
	}
	
	private function createButtons():Void
	{
		button1 = createButton();
		button1.pos.x = 75;
		
		button2 = createButton();
		button2.pos.x = 75;
		button2.pos.y = 35;
	}
	
	private function createButton():Visual
	{
		return new Visual({
			name : 'ball',
			color : colour.clone(),
			geometry : Luxe.draw.circle({x:0, y:0, r:15}),
			parent : parent
		});
	}
	
	private function createKey():Visual
	{
        return new Visual({
			color : colour.clone(),
			size : new Vector(30, 30),
			parent : parent
		});
	}
	
	public function update():Void
	{
		ball.pos.x = gamepad.x * 25;
		ball.pos.y = gamepad.y * 25;
		
		button1.color.a = gamepad.fire1.isDown ? 1 : 0.2;
		button2.color.a = gamepad.fire2.isDown ? 1 : 0.2;
		
		up.color.a = gamepad.up.isDown ? 1 : 0.2;
		down.color.a = gamepad.down.isDown ? 1 : 0.2;
		left.color.a = gamepad.left.isDown ? 1 : 0.2;
		right.color.a = gamepad.right.isDown ? 1 : 0.2;
	}

	public function set_x(v:Float) return parent.pos.x = v;
	public function set_y(v:Float) return parent.pos.y = v;
}