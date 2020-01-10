local enabled = themeConfig:get_data().global.SongBGEnabled
local brightness = 0.3

local t = Def.ActorFrame {}

if enabled then
	t[#t + 1] =
		Def.Sprite {
			CurrentSongChangedMessageCommand = function(self)
				self:finishtweening():smooth(0.5):diffusealpha(0):sleep(0.2):queuecommand("ModifySongBackground")
			end,
			ModifySongBackgroundCommand = function(self)
				self:finishtweening()
				if GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSong():GetBackgroundPath() then
					self:finishtweening()
					self:visible(true)
					self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath())
					self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
					self:sleep(0.25)
					self:smooth(0.5)
					self:diffusealpha(brightness)
				else
					self:visible(false)
				end
			end,
			OffCommand = function(self)
				self:smooth(0.5):diffusealpha(0)
			end,
			BGOffMessageCommand = function(self)
				self:finishtweening()
				self:visible(false)
			end
		}
end



return t
