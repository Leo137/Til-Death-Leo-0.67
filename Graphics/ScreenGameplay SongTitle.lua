return LoadFont("ScreenGameplay","SongTitle") .. {
	CurrentSongChangedMessageCommand=function(self) self:playcommand("Refresh"):zoom(40) end;
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = nil;
		local sText = ""
		if vSong then
			sText = vSong:GetDisplayArtist() .. " - " .. vSong:GetDisplayFullTitle()
		end
		if vCourse then
			sText = vCourse:GetDisplayFullTitle() .. " - " .. vSong:GetDisplayFullTitle();
		end
		self:settext( sText );
		self:playcommand( "On" );
	end;
};