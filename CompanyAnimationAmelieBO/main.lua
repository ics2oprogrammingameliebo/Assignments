-- Title: CompanyLogoAnimation
-- Name: AmelieBenderOlivas
-- Course: ICS2O/3C
-- This program animates my company logo.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set background colour
display.setDefault("background", 1, 1, 1)
--------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------
-- character/ logo images with width and height
local sky = display.newImageRect("Images/backgroundAmelieBO@2x.png", 750, 750)
local stars = display.newImageRect("Images/StarsAmelieBO@2x.png", 750, 750)
local stars2 = display.newImageRect("Images/StarsAmelieBO@2x.png", 750, 750)
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

stars2.x = 500
stars2.y = 380

earth.x = 500
earth.y = 380

rocketShip.x = 1400
rocketShip.y = 380

transition.to(rocketShip, {x=400, y=380, time=1000})

fire.x = 1620
fire.y = 400

transition.to(fire, {x=620, y=400, time=1000})
--------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------

-- create sound variables
local rocketSound = audio.loadSound ( "Sounds/rocketSound.mp3" )
local rocketSoundChannel

rocketSoundChannel = audio.play(rocketSound)

local barkSound = audio.loadSound ( "Sounds/bark.mp3" )
local barkSoundChannel

barkSoundChannel = audio.play(barkSound)
-------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------

-- Function: fade in FadeIn 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the visibility in the image by making it fade in.

-- set the earth to be transparent
sky.alpha = 0
earth.alpha = 0
stars.alpha = 0
fire.alpha = 0

local function FadeInBkg(event)

-- make the images fade in
sky.alpha = sky.alpha + 0.01
earth.alpha = earth.alpha + 0.01
end

-- FadeIn will be called 
Runtime:addEventListener("enterFrame", FadeInBkg)


local function FadeIn(event)

-- make the images fade in
stars.alpha = stars.alpha + 0.01
fire.alpha = fire.alpha + 0.01

-- scale the stars2 so that they grow
stars2:scale( 1.03, 1.03)
end

-- FadeIn will be called 
Runtime:addEventListener("enterFrame", FadeIn)
-- Title: CompanyLogoAnimation
-- Name: AmelieBenderOlivas
-- Course: ICS2O/3C
-- This program animates my company logo.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set background colour
display.setDefault("background", 1, 1, 1)
--------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------
-- character/ logo images with width and height
local sky = display.newImageRect("Images/backgroundAmelieBO@2x.png", 750, 750)
local stars = display.newImageRect("Images/StarsAmelieBO@2x.png", 750, 750)
local stars2 = display.newImageRect("Images/StarsAmelieBO@2x.png", 750, 750)
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

stars2.x = 500
stars2.y = 380

earth.x = 500
earth.y = 380

rocketShip.x = 1400
rocketShip.y = 380

transition.to(rocketShip, {x=400, y=380, time=1000})

fire.x = 1620
fire.y = 400

transition.to(fire, {x=620, y=400, time=1000})
--------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------

-- create sound variables
local rocketSound = audio.loadSound ( "Sounds/rocketSound.mp3" )
local rocketSoundChannel

rocketSoundChannel = audio.play(rocketSound)

local barkSound = audio.loadSound ( "Sounds/bark.mp3" )
local barkSoundChannel

barkSoundChannel = audio.play(barkSound)
-------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------

-- Function: fade in FadeIn 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the visibility in the image by making it fade in.

-- set the earth to be transparent
sky.alpha = 0
earth.alpha = 0
stars.alpha = 0
fire.alpha = 0

local function FadeInBkg(event)

-- make the images fade in
sky.alpha = sky.alpha + 0.01
earth.alpha = earth.alpha + 0.01
end

-- FadeIn will be called 
Runtime:addEventListener("enterFrame", FadeInBkg)


local function FadeIn(event)

-- make the images fade in
stars.alpha = stars.alpha + 0.01
fire.alpha = fire.alpha + 0.01

-- scale the stars2 so that they grow
stars2:scale( 1.03, 1.03)
end

-- FadeIn will be called 
Runtime:addEventListener("enterFrame", FadeIn)

