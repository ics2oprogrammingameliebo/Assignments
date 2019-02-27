-- Title: DisplayShapes
-- Name: Amelie B-)
-- Course: ICS2O/3C
-- This program displays three shapes on the ipad of different colours with 
--borders. Underneath each shape is the name of it.

-- create my local variables 
local areaText
local textSize = 50
local myTriangle
local baseOfTriangle = 350
local heightOfTriangle = 200
local areaOfTriangle
local verticesTriangle = {  0, -50, -50, 25, 50, 25,}

-- set the background color of my screen.Remeber that colors are between 0 and 1.
display.setDefault("background", 0, 0, 0)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the triangle that is half the width and half the height of the screen size.
myTriangle = display.newPolygon(500, 500, verticesTriangle)

-- anchor the triangle in the top left corner of the screen and set its (x,y) position
myTriangle.anchorX = 0.5
myTriangle.anchorY = 100

-- set the width of the border
myTriangle.strokeWidth = 20

-- set the color of the triangle
myTriangle:setFillColor(0/255, 0/255, 0/255)

-- set the color of border
myTriangle:setStrokeColor(51/255, 255/255, 51/255)

-- calculate the area
areaOfTriangle = heightOfTriangle * baseOfTriangle/2

-- write the name of shape on the screen. 
areaText = display.newText("Triangle", 0,0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 415
areaText.y = 515
areaText = display.contentHeight/2

-- write the area on the screen.
areaText = display.newText("The area of this triangle with a base of \n" ..
	baseOfTriangle .. " and a height of " .. heightOfTriangle .. " is " ..
	areaOfTriangle .. "pixels²." , 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 90
areaText.y = 600
areaText.y = display.contentHeight/1.3

-- create my local variables
local areaText
local textSize = 50
local myParallel
local verticesParallel = { -25, -50, -25, 25, 35, 50, 35, -35}

-- draw the parallelogram that is half the width and half the height of the screen size.
myParallel = display.newPolygon(500, 500, verticesParallel)