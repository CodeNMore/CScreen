--[[
CScreen v1.0 by CodeNMore
A simple way to make resolution-independent Love2D games
Tested for LOVE 0.10.1
See: https://github.com/CodeNMore/CScreen

Zlib License:
Copyright (c) 2016 CodeNMore

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from
the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
claim that you wrote the original software. If you use this software in
a product, an acknowledgment in the product documentation would be appreciated
but is not required.

2. Altered source versions must be plainly marked as such, and must not be
misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.

--]]

local CScreen = {}
local rx, ry, fsv, ctr = 800, 600, 1.0, false
local tx, ty = 0.0, 0.0

-- Initializes CScreen with the initial size values
-- call this before using CScreen
function CScreen.init(basew, baseh, center)
	rx = basew or 800
	ry = baseh or 600
	ctr = center or false
	tx = 0
	ty = 0
	CScreen.update(love.graphics.getWidth(), love.graphics.getHeight())
end

-- Applies centering calculations
function CScreen.applyCentering()
	if ctr then
		love.graphics.translate(tx, ty)
	end
end

-- Applies scaling calculations
function CScreen.applyScaling()
	love.graphics.scale(fsv, fsv)
end

-- Scales and centers all graphics properly
-- call this before drawing objects
function CScreen.apply()
	CScreen.applyCentering()
	CScreen.applyScaling()
end

-- Updates CScreen when the window size changes
-- call this in love.resize(w,h)
function CScreen.update(width, height)
	local sx = width / rx
	local sy = height / ry
	fsv = math.min(sx, sy)

	-- Calculate center translations if needed
	if ctr and fsv == sx then
		-- Center vertically
		tx = 0
		ty = (height / 2) - (ry * fsv / 2)
	elseif ctr and fsv == sy then
		-- Center horizontally
		ty = 0
		tx = (width / 2) - (rx * fsv / 2)
	end
end

-- Return the table for use
return CScreen