-- Title: MathQuiz
-- Name: Amelie Bender-Olivas
-- Course: ICS2O/3C
-- This program displays a math question wich is either addition, 
--subtraction, multiplication ot division and asks the user to answer
-- in a numeric texfield.
-----------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

 -- set the background color
display.setDefault("background", 0/255, 0/255, 51/255)

 -------------------------------------------------------------------------
 -- LOCAL VARIABLES
 -------------------------------------------------------------------------

 -- create local variables
 local questionObject

 local correctObject
 local incorrectObject
 local incorrectObject2

 local NumericTextFields

 local randomNumber1
 local randomNumber2
 local randomOperator

 local userAnswer
 local timeRemainingObjec
 local numberCorrectObject
 
 local score = 0
 local totalScore = 5
 local scoreObject
-------------------------------------------------------------------
-- variables for the timers
local totalSeconds = 11
local secondsLeft = 10
local clockText
local countDownTimer
local pointsObject
local points

local lives = 3
local heart1
local heart2
local heart3

local gameOver
local win

----------------------------
 -- game over sound
 local gameOverSound = audio.loadSound( "Sounds/gameover.mp3")
 local gameOverSoundChannel

 -- win sound
--------------------------------------------------------------------
-- LOCAL FUNCTION
---------------------------------------------------------------------

local function UpdateTime()

    -- decrement the number of seconds
    secondsLeft = secondsLeft - 1

    -- Display the number of seconds left in the clock object
    clockText.text = secondsLeft .. ""

    -- decrement the number of correct
    score = score + 1

    -- Display the number of correct in the score object
    scoreObject.text = score .. ""

    if (userAnswer == correctAnswer) then
        -- reset the seconds left and dont lose a life
        secondsLeft = totalSeconds
        lives = lives
        -- track the score
        score = totalScore

    elseif (secondsLeft == 0) then
       -- reset the number of seconds left
       secondsLeft = totalSeconds
       lives = lives - 1

    elseif (secondsLeft == 0) then
       -- reset the number of seconds left
       correctAnswer = totalSeconds
       lives = lives - 1
       end


        -- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND,
        -- SHOW A YOU LOOSE IMAGE AND CANCEL THE TIMER, REMOVE THE
        -- THIRD HEART BY MAKING IT INVISIBLE
        if (lives == 3) then
            heart3.isVisible = true
            gameOver.isVisible = false
        elseif (lives == 2) then
            heart3.isVisible = false
        elseif (lives == 1) then
            heart2.isVisible = false
         elseif (lives == 0) then
            heart1.isVisible = false
            gameOver.isVisible = true
            gameOverSoundChannel = audio.play(gameOverSound)
            timer.performWithDelay(2000, HideIncorrect)
            timer.cancel(countDownTimer) 
        end
        -- *** CALL THE FUNCTION TO ASK A NEW QUESTION
    end

-- funtion that calls the timer
local function StartTimer()

    -- create a countdown timer that looops infinitely
   countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

 -------------------------------------------------------------------
 -- SOUNDS
 -------------------------------------------------------------------
 -- Correct sound
 local correctSound = audio.loadSound( "Sounds/correct.mp3")
 local correctSoundChannel

 -- Incorrect sound
 local incorrectSound = audio.loadSound( "Sounds/incorrect.mp3")
 local incorrectSoundChannel
 ---------------------------------------------------------------------- 
 -- LOCAL FUNCTIONS
 ----------------------------------------------------------------------

 local function AskQuestion()
 	-- generate a random number between 1 and 2
 	-- ** MAKE SURE TO DECLARE THIS VARIABLE ABOVE
    randomOperator = math.random(1,5)

    -- generate 2 random numbers
 	randomNumber1 = math.random(1, 20)
 	randomNumber2 = math.random(1, 20)
    randomNumber3 = math.random(1, 10)
    randomNumber4 = math.random(1, 10)
    randomNumber5 = math.random(1, 100) 
    randomNumber6 = math.random(1, 100)

 	-- if the random operator is 1, the do addition
 	if (randomOperator == 1) then

    -- calculate the correct answer
 	correctAnswer = randomNumber1 + randomNumber2

 	-- create question in text object
 	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

    -- otherwise, if the random operator is 2, do subtraction
    elseif (randomOperator == 2) then
    	--calculate the correct answer
    	correctAnswer = randomNumber1 - randomNumber2

    	-- create question in text field
    	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

     -- otherwise, if the random operator is 3, do multiply
    elseif (randomOperator == 3) then
    	--calculate the correct answer
    	correctAnswer = randomNumber3 * randomNumber4

    	-- create question in text field
    	questionObject.text = randomNumber3 .. " × " .. randomNumber4 .. " = "

    	-- otherwise, if the random operator is 4, do divide
    elseif (randomOperator == 4) then
    	--calculate the correct answer
    	correctAnswer = randomNumber5 / randomNumber6

    	-- create question in text field
    	questionObject.text = randomNumber5 .. " ÷ " .. randomNumber6 .. " = "
    end
 end

 local function HideCorrect()
 	correctObject.isVisible = false
 	AskQuestion()
 end


 local function HideIncorrect()
 	incorrectObject.isVisible = false
    incorrectObject2.isVisible = false
 	AskQuestion()
 end

 local function NumericFieldListener( event )

 	-- User begins editing "numericField"
 	if ( event.phase == "began ") then

 		-- clear text field
 		event.target.text = " "

 	elseif ( event.phase == "submitted" ) then

 		-- when the answer is submitted (enter key is pressed) set user input to user's answer
 		userAnswer = tonumber(event.target.text)

 		-- if the users answer and the correct answer are the same:
 		if (userAnswer == correctAnswer) then
 			correctObject.isVisible = true
 			incorrectObject.isVisible = false
            incorrectObject2.isVisible = false

            correctSoundChannel = audio.play(correctSound)

 			timer.performWithDelay(2000, HideCorrect)

 		else
 			incorrectObject.isVisible = true
            incorrectObject2.isVisible = true
 			correctObject.isVisible = false

            incorrectSoundChannel = audio.play(incorrectSound)

 			timer.performWithDelay(2000, HideIncorrect)
 		end
        -- clear text field
 		event.target.text = " "

 	end
 end
 --------------------------------------------------------------------------
 -- OBJECT CREATION
 --------------------------------------------------------------------------
gameOver = display.newImageRect("Images/game_over.png", 200, 200)
gameOver.x = display.contentWidth * 4/ 8
gameOver.y = display.contentHeight * 5.5 / 7
gameOver.isVisible = false

 -- display a question and set the color
 questionObject = display.newText ( " ", display.contentWidth/3.5, display.contentHeight/2, nil, 60 )
questionObject:setTextColor(51/255, 255/255, 255/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Awesome! You got it right!", display.contentWidth/2, display.contentHeight*2/3, nil, 60 )
correctObject:setTextColor(30/255, 179/255, 0/255)
correctObject.isVisible = false

-- create the correct text object and make it invisible
incorrectObject = display.newText( "Sorry, that is incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 60 )
incorrectObject:setTextColor(204/255, 0/255, 43/255)
incorrectObject.isVisible = false

incorrectObject2 = display.newText( "The correct answer is " .. score , display.contentWidth/2, display.contentHeight*2.5/3, nil, 60 )
incorrectObject2:setTextColor(204/255, 0/255, 43/255)
incorrectObject2.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 250,80 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- create the lives to display on screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 5.5 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6.5 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 7.5 / 8
heart3.y = display.contentHeight * 1 / 7

win = display.newImageRect("Images/win.png", 100, 100)
win.x = display.contentWidth * 7.5 / 8
win.y = display.contentHeight * 1 / 7
win.isVisible = false

-- create the time remaining text object and make it visible
timeRemainingObject = display.newText( "Time Remaining:", display.contentWidth/3.5, display.contentHeight*0.4/3, nil, 60 )
timeRemainingObject:setTextColor(51/255, 255/255, 255/255)
timeRemainingObject.isVisible = true

clockText = display.newText ( "" .. secondsLeft, display.contentWidth/1.8, display.contentHeight/7.5, nil, 60 )
clockText:setTextColor(51/255, 255/255, 255/255)

-- create the time remaining text object and make it visible
numberCorrectObject = display.newText( "Number Correct:", display.contentWidth/3, display.contentHeight*1/3, nil, 60 )
numberCorrectObject:setTextColor(51/255, 255/255, 255/255)
numberCorrectObject.isVisible = true

scoreObject = display.newText ( "" .. score, display.contentWidth/1.7, display.contentHeight/3, nil, 50 )
scoreObject:setTextColor(51/255, 255/255, 255/255)
------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
StartTimer()