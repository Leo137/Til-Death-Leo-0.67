local t = Def.ActorFrame{}
--t[#t+1] = LoadActor("../_frame")
t[#t+1] = LoadActor("../../_PlayerInfo")
t[#t+1] = LoadActor("../currenttime")



t[#t+1] = LoadFont("Common Normal")..{
  InitCommand=function(self)
    self:xy(7,10):zoom(0.4):halign(0):maxwidth(205/0.4)
  end,
  BeginCommand=function(self)
    self:queuecommand("Set")
  end,
  SetCommand=function(self) 
    self:settext(GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
  end
}

t[#t+1] = LoadFont("Common Normal")..{
  InitCommand=function(self)
    self:xy(7,20):zoom(0.4):halign(0):maxwidth(205/0.4)
  end,
  BeginCommand=function(self)
    self:queuecommand("Set")
  end,
  SetCommand=function(self) 
    if GAMESTATE:IsCourseMode() then
      self:settext(GAMESTATE:GetCurrentCourse():GetScripter())
    else
      self:settext(GAMESTATE:GetCurrentSong():GetDisplayArtist())
    end
  end
}

--Group folder name
local frameWidth = 280
local frameHeight = 20
local frameX = SCREEN_WIDTH-5
local frameY = 15

t[#t+1] = LoadFont("Common Large") .. {
  InitCommand=function(self)
    self:xy(frameX,frameY):halign(1):zoom(0.4):maxwidth((frameWidth-40)/0.35)
  end,
  BeginCommand=function(self)
    self:queuecommand("Set"):diffuse(color("#FFFFFF")):strokecolor(color("#000000"))
  end,
  SetCommand=function(self)
    local song = GAMESTATE:GetCurrentSong()
    if song ~= nil then
      self:settext(song:GetGroupName())
    end
  end
}

t[#t+1] = LoadActor("../../_cursor");

return t