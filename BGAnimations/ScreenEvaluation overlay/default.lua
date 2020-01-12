local t = Def.ActorFrame {}
local EvalscreenSidebar = playerConfig:get_data(pn_to_profile_slot(PLAYER_1)).EvalscreenSidebar

if EvalscreenSidebar then
	t[#t + 1] = LoadActor("sidebar/default")
	return t
end

t[#t + 1] = LoadActor("../_frame")
t[#t + 1] = LoadActor("../_PlayerInfo")
t[#t + 1] = LoadActor("currenttime")

translated_info = {
	Title = THEME:GetString("ScreenEvaluation", "Title"),
	Replay = THEME:GetString("ScreenEvaluation", "ReplayTitle")
}

--what the settext says
t[#t + 1] =
	LoadFont("Common Large") ..
	{
		InitCommand = function(self)
			self:xy(5, 32):halign(0):valign(1):zoom(0.55):diffuse(getMainColor("positive"))
			self:settext("")
		end,
		OnCommand = function(self)
			local title = translated_info["Title"]
			local ss = SCREENMAN:GetTopScreen():GetStageStats()
			if not ss:GetLivePlay() then title = translated_info["Replay"] end
			self:settextf("%s:", title)
		end,
	}

--Group folder name
local frameWidth = 280
local frameHeight = 20
local frameX = SCREEN_WIDTH - 5
local frameY = 15

t[#t + 1] =
	LoadFont("Common Large") ..
	{
		InitCommand = function(self)
			self:xy(frameX, frameY + 5):halign(1):zoom(0.55):maxwidth((frameWidth - 40) / 0.35)
		end,
		BeginCommand = function(self)
			self:queuecommand("Set"):diffuse(getMainColor("positive"))
		end,
		SetCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song ~= nil then
				self:settext(song:GetGroupName())
			end
		end
	}

t[#t + 1] = LoadActor("../_cursor")

return t
