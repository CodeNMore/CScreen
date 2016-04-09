# CScreen
A simple way to make resolution-independent Love2D games, by CodeNMore

## Basic Usage
CScreen is very simple to use, and can be implemented in nearly any type of game.
```lua
local CScreen = require "cscreen"

function love.load()
	CScreen.init(800, 600, true)
end

function love.draw(dt)
	CScreen.apply()
	-- Draw all objects here!
end

function love.resize(width, height)
	CScreen.update(width, height)
end
```