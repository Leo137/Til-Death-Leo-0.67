local sm5SongProgressEnabled = playerConfig:get_data(pn_to_profile_slot(PLAYER_1)).sm5SongProgressStyle

if sm5SongProgressEnabled then
  return LoadActor(THEME:GetPathG("LifeMeterBar SM5", "over"))
end

return Def.ActorFrame{}