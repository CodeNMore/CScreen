# CScreen
A simple way to make resolution-independent Love2D games, by CodeNMore. This allows your game to be resized to any resolution by the user and still keep the aspect ratio and look pretty!

This version has been tested (and works!) with LOVE 0.10.1

## Basic Usage
CScreen is very simple to use, and can be implemented in nearly any type of game. Simply place the *cscreen.lua* file into your game directory, and follow the below example:
```lua
local CScreen = require "cscreen"

function love.load()
	CScreen.init(800, 600, true)
end

function love.draw(dt)
	CScreen.apply()
	-- Draw all objects here!
	CScreen.cap()
end

function love.resize(width, height)
	CScreen.update(width, height)
end
```

## Basic Documentation
<table>
	<tr>
		<th>Function</th>
		<th>Parameters</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>init(tw, th, center)</td>
		<td>
			<b>tw</b> (800) the target screen width<br>
			<b>th</b> (600) the target screen height<br>
			<b>center</b> (true) whether or not to letterbox
		</td>
		<td>
			Use <em>tw</em> and <em>th</em> to set the target width and height of the game screen. This defaults to 800 and 600, or a 4:3 screen ratio. Set <em>center</em> to true to center, or letterbox, the game screen (generally this should be true). Usually this is called in <em>love.load()</em>.
		</td>
	</tr>
	<tr>
		<td>update(w, h)</td>
		<td>
			<b>w</b> (int) the new screen width<br>
			<b>h</b> (int) the new screen height
		</td>
		<td>
			This allows CScreen to continue to properly resize the graphics. Usually this is called in <em>love.resize(w, h)</em> passing along the new screen width and height to the update function.
		</td>
	</tr>
	<tr>
		<td>apply()</td>
		<td>
			none
		</td>
		<td>
			Will apply any calculations to properly draw the screen. Usually this is called at the beginning of <em>love.draw(dt)</em>. This function calls <em>applyCentering()</em> and <em>applyScaling()</em>.
		</td>
	</tr>
	<tr>
		<td>cap()</td>
		<td>
			none
		</td>
		<td>
			Actually draws the letterbox borders using <em>love.graphics.rectangle(..)</em> using the color black, then restores the previously set color. <b>**This is called at the end of <em>love.draw(dt)</em>, as drawing after this line will result in an incorrect ratio.</b>b>
		</td>
	</tr>
	<tr>
		<td>applyCentering()</td>
		<td>
			none
		</td>
		<td>
			Applies centering calculations (if needed) via <em>love.graphics.translate(..)</em>. Generally this should not be called outside of CScreen.
		</td>
	</tr>
	<tr>
		<td>applyScaling()</td>
		<td>
			none
		</td>
		<td>
			Applies screen scaling calculations via <em>love.graphics.scale(..)</em>. Generally this should not be called outside of CScreen.
		</td>
	</tr>
</table>