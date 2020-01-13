local magnitude = 0.03
local maxDistX = SCREEN_WIDTH * magnitude
local maxDistY = SCREEN_HEIGHT * magnitude

local enabled = themeConfig:get_data().global.SongBGEnabled and not (GAMESTATE:IsCourseMode())
local brightness = 0.3

local t = Def.ActorFrame {}

if enabled then
	t[#t + 1] =
		Def.Sprite {
		Name = "MouseXY",
		CurrentSongChangedMessageCommand = function(self)
			self:finishtweening():smooth(0.5):diffusealpha(0):sleep(0.35):queuecommand("ModifySongBackground")
		end,
		ModifySongBackgroundCommand = function(self)
			if GAMESTATE:GetCurrentSong() then
				if GAMESTATE:GetCurrentSong():GetBackgroundPath() then
					self:visible(true)
					self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath())
					if moveBG then
						self:scaletocover(0 - maxDistY / 8, 0 - maxDistY / 8, SCREEN_WIDTH + maxDistX / 8, SCREEN_BOTTOM + maxDistY / 8)
					else
						self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
					end
					self:sleep(0.25)
					self:smooth(0.5)
					self:diffusealpha(brightness)
				else
					self:visible(false)
				end
			else
				self:visible(false)
			end
		end,
		OffCommand = function(self)
			self:smooth(0.5):diffusealpha(0)
		end
	}
end

return t
