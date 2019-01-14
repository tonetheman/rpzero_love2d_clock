
local FONTSIZE=96
-- used my love2d for ttf font
local myFont = nil

-- holds os representation of the current date/time
local t = nil

-- width and height of the window
local w = nil
local h = nil

function love.load()
	-- save off the width and height for use later
	w = love.graphics.getWidth()
	h = love.graphics.getHeight()

	-- load the ttf from the disk
	myFont = love.graphics.newFont("alarm_clock.ttf",FONTSIZE)

	-- tell love to use the font and set the color
	love.graphics.setFont(myFont)
	-- this is blue (rgb) 
	love.graphics.setColor(0,0,255)

	love.mouse.setVisible(false)
end

function love.update()
	-- get the date
	t = os.date("*t")
end

function love.draw()
	-- format the string for the screen
	-- %02d is zero filled 2 places
	ts = string.format("%02d:%02d:%02d", t.hour,t.min,t.sec)

	-- determine the width and height of the string
	-- so we can center it
	local tw = myFont:getWidth(ts)
	local th = myFont:getHeight(ts)

	-- draw it
	love.graphics.print(ts,w/2-(tw/2),h/2-(th/2))
end
