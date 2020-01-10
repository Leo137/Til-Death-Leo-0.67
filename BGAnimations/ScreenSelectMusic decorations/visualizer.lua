local showVisualizer = themeConfig:get_data().global.ShowVisualizer

if showVisualizer then
  local vis =
    audioVisualizer:new {
    x = 219,
    y = 358,
    maxHeight = 30,
    width= 250,
    freqIntervals = audioVisualizer.multiplyIntervals(audioVisualizer.defaultIntervals, 5),
    color = getMainColor("positive"),
    onBarUpdate = function(self)
      --[
      self:diffusetopedge(getMainColor("frames"))
      self:diffusebottomedge(getMainColor("positive"))
      --]]
      --[[
      self:diffuselowerleft()
      self:diffuseupperleft()
      self:diffuselowerright()
      self:diffuseupperright()
      --]]
    end
  }
  return vis;
end