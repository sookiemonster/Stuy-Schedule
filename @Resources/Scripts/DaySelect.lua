orders = {'16161', '06161', '61616', '01616', '16161', '61616', '16161',
          '61062', '16161', '61600', '16161', '61616', '16161', '61600',
          '00000', '16161', '61616', '01616', '16161'}

function get_order(week_num)
  if week_num < 53 then
    return orders[week_num-37]
  else
    return orders[week_num + 52 - 37]
  end
end

function Initialize()
  current_day = SKIN:GetMeasure('GetToday')
  week_no = SKIN:GetMeasure('MeasureWeek')
end

function Update()
   curr_week = get_order(week_no:GetValue())
   today = current_day:GetValue()
   if today % 6 ~= 0 then
     today_periods = tonumber(string.sub(curr_week, today, today))
     SKIN:Bang('!SetVariable', 'periods', today_periods)
   else
     SKIN:Bang('!SetVariable', 'periods', 0)
   end
end
