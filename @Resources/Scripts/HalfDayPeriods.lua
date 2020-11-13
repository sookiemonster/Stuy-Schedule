function TexttoTime(text)
  time = tonumber(text)
  hour = math.floor(time / 100)
  minute = time % 100
  if minute == 0 then
    minute = '00'
  elseif minute < 10 then
    minute = '0' .. minute end
  if time < 100 then
    return('12:' .. minute .. 'AM')
  elseif time < 1200 then
    return(hour .. ':' .. minute .. 'AM')
  elseif time >= 1300 then
    return(hour-12 .. ':' .. minute .. 'PM')
  else
    return(hour .. ':' .. minute .. 'PM')
  end
end

function MakeTimeRange(t1, t2)
  return t1 .. ' - ' .. t2
end

starttimes = {}
endtimes = {}
times = {}

function Initialize()
   for x=1,10 do
     starttimes[x] = SKIN:GetVariable('hstart' .. x)
     endtimes[x] = SKIN:GetVariable('hend' .. x) end
     for x=1,#starttimes do
       period='h' .. x
       times[x] = MakeTimeRange( TexttoTime(starttimes[x]), TexttoTime(endtimes[x]) )
       SKIN:Bang('!SetVariable', period, times[x])
     end
     SKIN:Bang('!Redraw')
end
