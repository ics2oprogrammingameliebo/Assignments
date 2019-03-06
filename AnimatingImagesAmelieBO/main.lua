-- Title: AnimatingImages
-- Name: AmelieBO
-- Course: ICS2O/3C
-- This program moves three images in different ways.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 2

-- background image with the width and height
local backgroundImage = display.newImageRect("Images/ocean.jpg", 2048, 1536)

-- characters image with the width and height
local redfish = display.newImageRect("Images/redfish.png", 200, 200)
local jelly = display.newImageRect("Images/jelly.png", 100, 100)

local areaText
local textSize = 90
local TextSize = 50

-- display text on the screen.
areaText = display.newText("Under the Sea", 0,0, Arial, textSize)

-- set the color of the newText
areaText:setTextColor(255/255, 255/255, 255/255)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 220
areaText.y = 20
areaText = display.contentHeight/2 


-- display text on the screen.
areaText = display.newText("Click and drag the stingray", 0,0, Arial, TextSize)

-- set the color of the newText
areaText:setTextColor(255/255, 255/255, 255/255)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 300
areaText.y = 650
areaText = display.contentHeight/2 
---------------------------------------------------
-- display text on the screen.
areaText = display.newText(" to move it around.", 0,0, Arial, TextSize)

-- set the color of the newText
areaText:setTextColor(255/255, 255/255, 255/255)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 400
areaText.y = 700
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
	-- make image move diagonally
	angle = math.rad(30)
	redfish.x = redfish.x - math.sin (40)
	redfish.y = redfish.y +  math.cos(50)
end

-- MoveredFish will be called over and over again
Runtime:addEventListener("enterFrame", MoveRedFish)
----------------------------------------------------------------

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
	-- Scale the image by 100% (x) and 100% (y)
   jelly:scale( 1.002, 1.002)
end

-- MoverJelly will be called over and over again
Runtime:addEventListener("enterFrame", MoveJelly)
-----------------------------------------

local sea = display.newImageRect("Images/Sea.png", 200, 200)
local SPEED = 1

local function move(event)

    sea.x = sea.x + math.cos(math.rad(sea.rotation)) * SPEED
    sea.y = sea.y + math.sin(math.rad(sea.rotation)) * SPEED
end

local function rotate(event)
    sea.rotation = sea.rotation + 2
end

Runtime:addEventListener("enterFrame", rotate)
-- set the image to be transparent
sea.alpha = 0

-- set the initial x and y position of the images
sea.x = 1100
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


-----------------------------------------------------------
local stingray = display.newImageRect("Images/stingray.png", 215, 215)
local stingrayWidth = stingray.width
local stingrayHeight = stingray.height

-- boolean variables to keep track of which object I touched first
local alreadyTouchedstingray = false
local areadyTouchedredfish = false
local alreadyTouchedjelly = false
local alreadyTouchedsea = false

-- set the initial x and y position of myImage
stingray.x = 150
stingray.y = 650

-- Function: StingrayListener
-- Input: touch listener
-- Output: none
-- Description: when stingray is touched, move her
local function StingrayListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedredfish == false) and (alreadyTouchedjelly == false) and (alreadyTouchedsea == false) then
			alreadyTouchedstingray = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedstingray == true) ) then
		stingray.x = touch.x
		stingray.y = touch.y
	end

	if (touch.phase == "ended") then
	alreadyTouchedredfish = false
	alreadyTouchedjelly = false
	alreadyTouchedsea = false
	end
end

-- add the respective listener to each object
stingray:addEventListener("touch", StingrayListener)