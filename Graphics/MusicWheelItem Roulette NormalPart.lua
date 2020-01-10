return Def.ActorFrame {	
	LoadActor(THEME:GetPathG("MusicWheelItem","Course NormalPart")) .. {
		InitCommand=function(self)
		 self:glow(color('1,1,1,0.25'))
		end;
	};
	LoadActor(THEME:GetPathG("MusicWheelItem","Course NormalPart")) .. {
		InitCommand=function(self)
		 self:blend(Blend.Add):rainbow():diffusealpha(0.325)
		end;
	};
};