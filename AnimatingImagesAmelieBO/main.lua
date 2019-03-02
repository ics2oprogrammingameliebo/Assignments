-- Title: AnimatingImages
-- Name: AmelieBO
-- Course: ICS2O/3C
-- This program moves three images in different ways.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 4

-- background image with the width and height
local backgroundImage = display.newImageRect("Images/ocean.jpg", 2048, 1536)

-- characters image with the width and height
local redfish = display.newImageRect("Images/redfish.png", 200, 200)
local jelly = display.newImageRect("Images/jelly.png", 200, 200)
local sea = display.newImageRect("Images/Sea.png", 200, 200)

local areaText
local textSize = 90

-- display text on the screen.
areaText = display.newText("Under the sea", 0,0, Consolas, textSize)

-- set the color of the newText
areaText:setTextColor(255/255, 255/255, 255/255)

-- anchor the text and set its (x.y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 220
areaText.y = 20
areaText = display.contentHeight/2

--------------------------------------------------------------
-- set the image to be visible
redfish.alpha = 1

-- set the initial x and y position of the images
redfish.x = 0
redfish.y = 100

-- Function: Move MoveRedFish
-- Input: this function accepts an event listener
-- Output: none
-- Description This funtion adds the scroll speed to the x-value of the ship
local function MoveRedFish(event)
	-- add the scroll speed to the x-value of the ship
	redfish.x = redfish.x + scrollSpeed
	-- change the transparency everytime it move so it fades out
	redfish.alpha = redfish.alpha + 0.01
	angle = math.rad(30)
redfish.x = redfish.x - math.sin (40)
redfish.y = redfish.y + math.cos(50)
end

-- MoveredFish will be called over and over again
Runtime:addEventListener("enterFrame", MoveRedFish)
----------------------------------------------------

-- set the initial x and y position of the images
jelly.x = 500
jelly.y = 900

-- Function: Move MoveJelly
-- Input: this function accepts an event listener
-- Output: none
-- Description This funtion adds the scroll speed to the x-value of the ship
local function MoveJelly(event)
	-- add the scroll speed to the x-value of the ship
	jelly.y = jelly.y - scrollSpeed
end

-- MoverJelly will be called over and over again
Runtime:addEventListener("enterFrame", MoveJelly)
-------------------------------------------------
-- set the image to be visible
sea.alpha = 0

-- set the initial x and y position of the images
sea.x = 900
sea.y = 500

-- Function: Move MoveSea
-- Input: this function accepts an event listener
-- Output: none
-- Description This funtion adds the scroll speed to the x-value of the ship
local function MoveSea(event)
	-- add the scroll speed to the x-value of the ship
	sea.x = sea.x - scrollSpeed
	-- change the transparency everytime it move so it fades out
	sea.alpha = sea.alpha + 0.01
end

-- MoveSea will be called over and over again
Runtime:addEventListener("enterFrame", MoveSea)