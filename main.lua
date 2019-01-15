
local FONTSIZE=196
-- used my love2d for ttf font
local myFont = nil

-- holds os representation of the current date/time
local t = nil

-- width and height of the window
local w = nil
local h = nil
local w_half = nil
local h_half = nil
local x_fudge_left = 25 -- amount we fudge the string over when we draw

function love.load()
	-- save off the width and height for use later
	w = love.graphics.getWidth()
	h = love.graphics.getHeight()
	w_half = w/2
	h_half = h/2

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
	-- print("tw/th: " .. tw .. " " .. th)

	-- draw it
	love.graphics.print(ts,w_half-(tw/2)-x_fudge_left,h_half-(th/2))
end
