local t = Def.ActorFrame {}
t[#t + 1] = LoadActor("ScreenEvaluation overlay/default")

local function input(event)
  if event.DeviceInput.button == "DeviceButton_enter" then
    SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
    return true
  end
  return false
end
t[#t + 1] = Def.ActorFrame {
  BeginCommand = function(self)
    SCREENMAN:GetTopScreen():AddInputCallback(MPinput)
    SCREENMAN:GetTopScreen():AddInputCallback(input)
    resetTabIndex()
  end,
  NumericInputActiveMessageCommand = function(self)
    numericinputactive = true
  end,
  NumericInputEndedMessageCommand = function(self)
    numericinputactive = false
  end
}
return t