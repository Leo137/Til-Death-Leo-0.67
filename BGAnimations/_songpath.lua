local t = Def.ActorFrame {};

t[#t+1] = LoadFont("Common Normal") .. {
  Name="SongPath";
  Text="";
  InitCommand=function(self)
   self:x(8):y(9):zoom(0.45):horizalign(left):shadowlength(0):maxwidth(675):playcommand("Refresh")
   self:diffusecolor(getMainColor('positive'));
  end;
  OnCommand=function(self)
   self:skewx(-0.0):strokecolor(Color("Outline"))
  end;
  CurrentSongChangedMessageCommand=function(self)
   self:playcommand("Refresh")
  end;
  OutCommand=function(self)
    self:settext("");
  end;

  RefreshCommand=function(self)
      
    --if ScreenSelectMusic:GetMusicWheel():GetSelectedType() == 'WheelItemDataType_Song' then
      local sText = "";
      if GAMESTATE:GetCurrentSong() then
        --local sText = getenv
        local song = GAMESTATE:GetCurrentSong();
        sText = "[ "..GAMESTATE:GetCurrentSong():GetGroupName().."/"..GAMESTATE:GetCurrentSong():GetDisplayMainTitle().." ]";
      end;
      
      local topScreen = SCREENMAN:GetTopScreen()
      if topScreen then
        local screenName = topScreen:GetName()
        
        if screenName == "ScreenSelectMusic" then
          if topScreen:GetMusicWheel():GetSelectedType() ~= 'WheelItemDataType_Song' then
            local index = topScreen:GetMusicWheel():GetCurrentIndex();
            sText = "[ "..topScreen:GetMusicWheel():GetWheelItem(0+6):GetText().." ]";
          end;
        end;
        if screenName == "ScreenNetSelectMusic" then
          --local selectMusic = topScreen.ScreenSelectMusic;
          --local t = topScreen:GetChildren();
          --for key,value in pairs(t) do
            --sText = sText .. " " .. key;
          --end;
          local MusicWheel = topScreen:GetChild("MusicWheel");
          if MusicWheel then
            if MusicWheel:GetSelectedType() ~= 'WheelItemDataType_Song' then
              local index = MusicWheel:GetCurrentIndex();
              sText = "[ "..MusicWheel:GetWheelItem(0+6):GetText().." ]";
            end;
          end;
        end;
        if screenName ~= "ScreenEvaluation" and  screenName ~= "ScreenNetEvaluation" then
          self:maxwidth(1850);
        end;
        if screenName == "ScreenNetRoom" then
          sText = "";
        end;
      end;
      self:settext( sText );
  end;
};

return t;