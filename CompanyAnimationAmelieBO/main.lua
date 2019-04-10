-- Title: CompanyLogoAnimation
-- Name: AmelieBenderOlivas
-- Course: ICS2O/3C
-- This program animates my company logo.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 8

-- set background colour
display.setDefault("background", 1, 1, 1)
--------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------
-- character/ logo images with width and height
local sky = display.newImageRect("Images/backgroundAmelieBO@2x.png", 750, 750)
local stars = display.newImageRect("Images/StarsAmelieBO@2x.png", 750, 750)
local earth = display.newImageRect("Images/earthAmelieBO@2x.png", 750, 750)
local rocketShip = display.newImageRect("Images/RocketShipAmelie@2x.png", 300, 205)
local fire = display.newImageRect("Images/fireAmelie@2x.png", 200, 70)

--------------------------------------------------------------------------------
-- X AND Y POSITIONS
--------------------------------------------------------------------------------
-- set the initaial x and y position of all the images
sky.x = 500
sky.y = 380

stars.x = 500
stars.y = 380

earth.x = 500
earth.y = 380

rocketShip.x = 400
rocketShip.y = 380

fire.x = 620
fire.y = 400
--------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------

-- create sound variables
local rocketSounds = audio.loadSound ( "Sounds/rocketSound.mp3" )
local rocketSoundChannel

rocketSoundChannel = audio.play(rocketSound)

timer.performWithDelay(200, HideCorrect)


local barkSound = audio.loadSound ( "Sounds/bark.mp3" )
local barkSoundChannel

barkSoundChannel = audio.play(barkSound)

timer.performWithDelay(8000, HideCorrect)
--------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------

-- Function: fade in FadeIn 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the visibility in the image by making it fade in.

-- set the earth to be transparent
sky.alpha = 0
earth.alpha = 0

local function FadeIn(event)

sky.alpha = sky.alpha + 0.01
earth.alpha = earth.alpha + 0.01
end

-- FadeIn will be called 
Runtime:addEventListener("enterFrame", FadeIn)

-- Function: fade in FadeInStars 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the visibility in the star image by making 
--it fade in 

-- set the stars to be transparent
stars.alpha = 0

local function FadeInStars(event)

stars.alpha = stars.alpha + 0.01
end

-- FadeIn will be called 
Runtime:addEventListener("enterFrame", FadeInStars)

-- Function: Move MoveRocket 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the rocket

local function MoveRocket(event)
	-- add the scroll speed to the x-value of the rocket
	rocketShip.x = rocketShip.x - scrollSpeed
end

-- MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocket)

barkSoundChannel = audio.play(barkSound)

timer.performWithDelay(8000)

-- set the stars to be transparent
fire.alpha = 0

-- Function: Move MveFire 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the fire

local function MoveFire(event)
	-- add the scroll speed to the x-value of the rocket
	fire.x = fire.x - scrollSpeed
	-- change the transparency everytime it moves
	fire.alpha = fire.alpha + 0.01
end

-- MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveFire)


