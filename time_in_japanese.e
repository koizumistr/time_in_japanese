class TIME_IN_JAPANESE
   --
   -- The Japanese format class for class TIME.
   --

inherit
   TIME_FORMATTER

create {ANY}
   default_create, set_time

feature {ANY}
   day_in (buffer: STRING)
      local
         s: STRING
      do
         if short_mode then
            inspect
               time.week_day
            when 0 then
               s := once "日"
            when 1 then
               s := once "月"
            when 2 then
               s := once "火"
            when 3 then
               s := once "水"
            when 4 then
               s := once "木"
            when 5 then
               s := once "金"
            when 6 then
               s := once "土"
            end
         else
            inspect
               time.week_day
            when 0 then
               s := once "日曜日"
            when 1 then
               s := once "月曜日"
            when 2 then
               s := once "火曜日"
            when 3 then
               s := once "水曜日"
            when 4 then
               s := once "木曜日"
            when 5 then
               s := once "金曜日"
            when 6 then
               s := once "土曜日"
            end
         end
         buffer.append(s)
      end

   month_in (buffer: STRING)
      do
         buffer.append(time.month.to_string + "月")
      end

   append_in (buffer: STRING)
      local
         shouwa: INTEGER_32; tmp: STRING
      do
         if japanese_calendar_mode then
            shouwa := time.year - 1925
            if shouwa < 64 then
               buffer.append("昭和" + shouwa.to_string)
            elseif shouwa = 64 then
               if time.month = 1 and time.day < 8 then
                  buffer.append("昭和64")
               else
                  buffer.append("平成元")
               end
            elseif shouwa < 94 and time.month < 5 then
               buffer.append("平成" + (shouwa - 63).to_string)
            elseif shouwa = 94 then
               if time.month < 5 then
                  buffer.append("平成31")
               else
                  buffer.append("令和元")
               end
            else
               buffer.append("令和" + (shouwa - 93).to_string)
            end
         else
            time.year.append_in(buffer)
         end
         if short_mode then
            buffer.extend(' ')
         else
            buffer.append("年")
         end
         month_in(buffer)
         if short_mode then
            buffer.extend(' ')
         end
         time.day.append_in(buffer)
         if not short_mode then
            buffer.append("日")
         end
         buffer.extend(' ')
         day_in(buffer)
         buffer.extend(' ')
         time.hour.append_in(buffer)
         if short_mode then
            buffer.extend(':')
         else
            buffer.append("時")
         end
         tmp := time.minute.to_string
         if 2 > tmp.count then
            tmp.insert_character('0', 1)
         end
         buffer.append_string(tmp)
         if not short_mode then
            buffer.append("分")
            tmp := time.second.to_string
            if 2 > tmp.count then
               tmp.insert_character('0', 1)
            end
            buffer.append_string(tmp + "秒")
         end
         buffer.extend(' ')
      end

   japanese_calendar_mode: BOOLEAN
         -- Japanese calendar (wareki) mode ?

   set_japanese_calendar_mode (value: BOOLEAN)
      do
         japanese_calendar_mode := value
      ensure
         japanese_calendar_mode = value
      end
end -- class TIME_IN_JAPANESE
