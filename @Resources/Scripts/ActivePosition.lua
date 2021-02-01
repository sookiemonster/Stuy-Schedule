function ToMinutes(time)
  return (math.floor(time / 100) * 60) + (time % 100)
end

function ToActivePos(n)
  num = (n - 485)/65
  if (num < 1) then
    return 0
  elseif (num > 5.83) then
    return 6
  elseif (num % 1 > .83) then
    return math.floor(num) + .5
  else
    return math.floor(num)
  end
end

function Initialize()
  time = SKIN:GetMeasure('MeasureTime')
end

function Update()
   curr_time = time:GetValue()
   curr_active = ToActivePos(ToMinutes(curr_time))
   SKIN:Bang('!SetVariable', 'activeposition', curr_active)
   if (curr_active % 1 == .5) then
     SKIN:Bang('!SetOption', 'Period' .. curr_active -.5, 'MeterStyle', 'Transition')
     SKIN:Bang('!SetOption', 'Period' .. curr_active +.5, 'MeterStyle', 'Transition')
   else
     SKIN:Bang('!SetOption', 'Period' .. curr_active, 'MeterStyle', 'Active')
     SKIN:Bang('!SetOption', 'Period' .. curr_active - 1, 'MeterStyle', 'NonActive')
   end
end
