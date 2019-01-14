
local myFont = nil
local t = nil
local w = nil
local h = nil

function love.load()
	w = love.graphics.getWidth()
	h = love.graphics.getHeight()
	myFont = love.graphics.newFont("alarm_clock.ttf",64)
	love.graphics.setFont(myFont)
	love.graphics.setColor(0,0,255)
end

function love.update()
	t = os.date("*t")
end

function love.draw()
	ts = string.format("%02d:%2d:%02d", t.hour,t.min,t.sec)
	local tw = myFont:getWidth(ts)
	local th = myFont:getHeight(ts)
	love.graphics.print(ts,w/2-(tw/2),h/2-(th/2))
end
