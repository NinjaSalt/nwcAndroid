---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals= require ("classes.globals") 
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local bkg = display.newRect( display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)

  local nbkg = display.newImage( "images/pauseBack.png", centerX, centerY, true )
  nbkg.height=display.contentHeight*.7; nbkg.width=display.contentWidth*.7
  group:insert (nbkg)

  local title = display.newText( "Pro Chef Tip!", 0, 0, globals.LOBSTERTWO, 35 )
  title:setFillColor(black)
  title.x = display.contentCenterX
  title.y = 75
  group:insert( title )

  local tap = display.newText( "TAP TO CONTINUE", 0, 0, globals.IMPRIMA, 16 )
  tap:setFillColor(black)
  tap.x = display.contentCenterX
  tap.y = 245
  group:insert( tap )
  
  -- invisible rectangle that moves text on when clicked.
  local inRect = display.newRect( display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight )
  inRect:setFillColor( gray )
  inRect.alpha = .1
  group:insert (inRect)

  local tutText = {}
  tutText = {"You won't make it much further with simple recipes alone. ", "Try cooking up some triple combos!", "Here's a sample to help you get started!"}

  local currentNum = 1

   local textContent = {
    text = tutText[currentNum],     
    x = display.contentWidth/2,
    y = 150,
    width = display.contentWidth/2,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    alpha = 0,
    align = "center"  --new alignment parameter
  }

  local currentText = display.newText( textContent )
  currentText: setFillColor( black )
  group:insert( currentText )

  -- print the actual tip.
  local function printTip()

    if (currentText ~= nil) then
      currentText: removeSelf()
    end

    currentNum = currentNum + 1 
    
    if (currentNum == 4) then
    storyboard.hideOverlay("scenes.scene_tipTriple", "slideUp", 500 )
    storyboard.showOverlay("scenes.scene_tipAntag", {effect = "fade", time = 900})
    --globals.completedTip = true
    else
    currentText = display.newText( tutText[currentNum], 0, 0, globals.IMPRIMA, 18 )
    currentText:setFillColor(black)
    currentText.x = display.contentCenterX
    if (currentNum == 3 ) then
      currentText.y = 110
    else
      currentText.y = 150
    end
    group:insert( currentText )

    -- tip image
    if (currentNum == 3) then
      local tipImage = display.newImage( "images/tip.png", 100,100, true )
      tipImage.x = display.contentWidth/2
      tipImage.y = display.contentHeight/2 + 20
      tipImage.width = 500/3
      tipImage.height = 400/3
      group:insert(tipImage)
    end

  end


  end
   inRect:addEventListener( "tap", printTip )






end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
 
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
 
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
 
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene