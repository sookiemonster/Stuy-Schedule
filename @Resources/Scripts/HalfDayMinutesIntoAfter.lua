function convert_to_minutes(time)
  hour = math.floor(time / 100)
  minute = time % 100
  return (hour * 60) + minute
end

function MinutesInto(time, pos)
  periodstart = SKIN:GetVariable('hstart' .. pos)
  return time - convert_to_minutes(periodstart)
end

function MinutesLeft(time, pos)
  periodend = SKIN:GetVariable('hend' .. pos)
  return convert_to_minutes(periodend) - time
end

function MinutesBefore(time, pos)
  pos = math.ceil(pos)
  nextperiodstart = SKIN:GetVariable('hstart' .. pos)
  return convert_to_minutes(nextperiodstart) - time
end

function Initialize()
  time = SKIN:GetMeasure('CurrentTimeMinutes')
  BeforeNextClass = SKIN:GetMeasure('BeforeNextClass')
end

function Update()
  current_time = time:GetValue()
  activepos = SKIN:GetVariable('activeposition')

  if (activepos % 1 ~= 0.5) and (activepos % 11 ~= 0) then
    into = tostring(MinutesInto(current_time, activepos))
    SKIN:Bang('!SetVariable', 'minutesin', into .. ' MINUTE(S) IN')

    left = tostring(MinutesLeft(current_time, activepos))
    SKIN:Bang('!SetVariable', 'minutesleft', left .. ' MINUTE(S) LEFT')
  elseif (activepos % 1 == 0.5) and (activepos % 11 ~= 0) then
    before = MinutesBefore(current_time, activepos)
    if before > 1 then
      SKIN:Bang('!SetOption', 'BeforeNextClass', 'Text', tostring(before) .. ' MINUTES BEFORE NEXT CLASS')
    else
      SKIN:Bang('!SetOption', 'BeforeNextClass', 'Text', '%1 SECOND(S) BEFORE NEXT CLASS')
    end
  end
end
