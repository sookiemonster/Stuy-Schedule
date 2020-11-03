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

starttimes = {}
endtimes = {}

function Initialize()
   for x=1,5 do
     starttimes[x] = SKIN:GetVariable('pstart' .. x)
     endtimes[x] = SKIN:GetVariable('pend' .. x) end
     for x=1,#starttimes do
       varstart='p' .. x .. 's'
       varend='p' .. x .. 'e'
       starttimes[x] = TexttoTime(starttimes[x])
       SKIN:Bang('!SetVariable', varstart, starttimes[x])
       endtimes[x] = TexttoTime(endtimes[x])
       SKIN:Bang('!SetVariable', varend, endtimes[x])
     end
     SKIN:Bang('!Redraw')
end
