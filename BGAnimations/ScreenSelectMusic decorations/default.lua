local t = Def.ActorFrame {}

-- t[#t + 1] = LoadActor("visualizer")
local topFrameHeight = 35
local bottomFrameHeight = 54
local borderWidth = 2

t[#t + 1] = LoadActor("tabs")
t[#t + 1] = LoadActor("wifetwirl")
t[#t + 1] = LoadActor("msd")
t[#t + 1] = LoadActor("songsearch")
t[#t + 1] = LoadActor("score")
t[#t + 1] = LoadActor("profile")
t[#t + 1] = LoadActor("filter")
t[#t + 1] = LoadActor("goaltracker")
t[#t + 1] = LoadActor("playlists")
t[#t + 1] = LoadActor("downloads")
t[#t + 1] = LoadActor("tags")
t[#t + 1] = LoadActor("stepsdisplay")

t[#t + 1] = LoadActor("../_mousewheelscroll")

local topFrameHeight = 50
local bottomFrameHeight = 54
local borderWidth = 2

--Frames
t[#t+1] = Def.Quad{
  InitCommand=function(self)
    self:xy(0,0):halign(0):valign(0):zoomto(SCREEN_WIDTH,topFrameHeight):diffuse(getMainColor('frames')):draworder(-41)
  end;
};
-- --FrameBorders
t[#t+1] = Def.Quad{
  InitCommand=function(self)
    self:xy(0,topFrameHeight):halign(0):valign(1):zoomto(SCREEN_WIDTH,borderWidth):diffuse(getMainColor('highlight')):diffusealpha(0.5):draworder(-41)
  end;
};


collectgarbage()
return t
