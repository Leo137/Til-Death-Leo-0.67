local t = Def.ActorFrame {}

t[#t + 1] =
Def.Quad {
  InitCommand = function(self)
    self:xy(SCREEN_WIDTH, 0):halign(1):valign(0):zoomto(capWideScale(get43size(350), 350), SCREEN_HEIGHT):diffuse(
      color("#33333399")
    )
  end,
  BeginCommand= function(self)
    SCREENMAN:GetTopScreen():AddInputCallback(MPinput)
  end
}

return t
