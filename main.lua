
gtick = require("gtick")
gtick.framerate = 5 --We intentionally bog down the draw framerate for saving battery

function love.load(args, unfilteredArgs)
	font = love.graphics.setNewFont("FiraCode/FiraCode-Retina.ttf", 92)
	love.window.setMode(640, 480, {resizable = true, vsync = false})
end

function love.update(dt)
	time = os.date('%Y-%m-%d %H:%M:%S')
	year = os.date("%Y")
	month = os.date("%m")
	day = os.date("%d")
	hour24 = os.date("%H")
	hour12 = hour24%12 or 0
	minute = os.date("%M")
	seconds = os.date("%S")
	if tostring(hour12):len() == 1 then
		hour12 = "0" .. hour12
	end
	if tonumber(hour24) > 12 then pm = "pm" else pm = "am" end
end

function love.draw()
	local width, height = love.graphics.getDimensions()
	local textw, texth = font:getWidth("00:00:00 PM"), font:getHeight("00:00:00 PM")
	local scale = math.min(width/textw, height/texth)
	local x,	y =  width*0.5, height*0.3
	local sx,	sy = scale*0.4, scale*0.4
	local ox,	oy = textw/2, texth/2
	love.graphics.print(hour12 ..":"..minute..":"..seconds.." "..pm, x, y, 0, sx, sy, ox, oy)
	love.graphics.print(love.system.getPowerInfo(), 0, 0, 0, .2, .2)
end

function love.keypressed(key, scancode, isrepeat)
	if key == "f5" then
		love.event.quit("restart")
	end
	if key == "escape" then
		love.event.quit()
	end
end