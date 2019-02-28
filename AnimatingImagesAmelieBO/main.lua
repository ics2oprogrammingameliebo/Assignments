-- Title: AnimatingImages
-- Name: AmelieBO
-- Course: ICS2O/3C
-- This program moves three images in different ways.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with the width and height
local backgroundImage = display.newImageRect("Images/ocean.jpg", 2048, 1536)

-- characters image with the width and height
local redfish = display.newImageRect("Images/redfish.png", 200, 200)
local jelly = display.newImageRect("Images/jelly.png", 200, 200)

-- set the image to be transparent
redfish.alpha = 0

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
end

-- MoveredFish will be called over and over again
Runtime:addEventListener("enterFrame", MoveRedFish)
----------------------------------------------------
-- set the image to be transparent
jelly.alpha = 0

-- set the initial x and y position of the images
jelly.x = 0
jelly.y = 300


-- Function: Move MoveJelly
-- Input: this function accepts an event listener
-- Output: none
-- Description This funtion adds the scroll speed to the x-value of the ship
local function MoveJelly(event)
	-- add the scroll speed to the x-value of the ship
	jelly.x = jelly.x + scrollSpeed
	-- change the transparency everytime it move so it fades out
	jelly.alpha = jelly.alpha + 0.01
end

-- MoveredFish will be called over and over again
Runtime:addEventListener("enterFrame", MoveJelly)