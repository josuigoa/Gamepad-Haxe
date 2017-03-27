package com.adapters.heaps;

import h2d.Graphics;
import h2d.Sprite;
import com.iainlobb.gamepad.Gamepad;

class GamepadView extends Sprite implements com.adapters.IGamepadView
{
    var background:Graphics;
	var ball:Graphics;
	var button1:Graphics;
	var button2:Graphics;
	var up:Graphics;
	var down:Graphics;
	var left:Graphics;
	var right:Graphics;
	var gamepad:Gamepad;
	var colour:Int;
	
	/**
	 * Visual representation of a Gamepad instance.
	 */
	public function new(_gamepad:Gamepad, _colour:UInt = 0x669900) 
	{
		super(null);
        background = new h2d.Graphics(this);
		
		gamepad = _gamepad;
        gamepad.view = this;
		colour = _colour;
		
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
		background.beginFill(colour, 0.2);
		background.drawRect(-50, -50, 100, 100);
		background.endFill();
	}
	
	private function drawCircle():Void
	{
		background.beginFill(colour, 0.2);
		background.drawCircle(0, 0, 50);
		background.endFill();
	}
	
	private function createBall():Void
	{
		ball = new Graphics(this);
		ball.beginFill(colour, 1);
		ball.drawCircle(0, 0, 25);
		ball.endFill();
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
		var button = new Graphics(this);
		button.beginFill(colour, 1);
		button.drawCircle(0, 0, 15);
		button.endFill();
		
		return button;
	}
	
	private function createKey():Graphics
	{
		var key = new Graphics(this);
		key.beginFill(colour, 1);
		key.drawRect(0, 0, 30, 30);
		key.endFill();
		
		return key;
	}
	
	public function update():Void
	{
		ball.x = gamepad.x * 25;
		ball.y = gamepad.y * 25;
		
		button1.alpha = gamepad.fire1.isDown ? 1 : 0.2;
		button2.alpha = gamepad.fire2.isDown ? 1 : 0.2;
		
		up.alpha = gamepad.up.isDown ? 1 : 0.2;
		down.alpha = gamepad.down.isDown ? 1 : 0.2;
		left.alpha = gamepad.left.isDown ? 1 : 0.2;
		right.alpha = gamepad.right.isDown ? 1 : 0.2;
	}
	
}