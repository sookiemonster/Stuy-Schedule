-- orders = {'16161', '06161', '61616', '01616', '16161', '61616', '16161',
--           '61062', '16161', '61600', '16161', '61616', '16161', '61600',
--           '00000', '16161', '61616', '01616', '16161'}
--
-- function get_order(week_num)
--   if week_num < 53 and week_num > 37 then
--     return orders[week_num-37]
--   elseif week_num < 37 then
--     return orders[week_num + 15]
--   else
--     return orders[week_num + 52 - 37]
--   end
-- end

orders = {'j0', 'j1', 'j2', '01616',             -- Jan
          '01616', '16160', '00000', '16161',         -- Feb
          '61616', '16161', '61616', '16161',         -- Mar
          '00000', '16161', '61616', '16161', '61616', -- Apr
          '16161', '61601', '61616', '16161',          -- May
          '06161', '61616', '16161', '61616'}         -- June

function get_order(week_num)
  return orders[week_num]
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
