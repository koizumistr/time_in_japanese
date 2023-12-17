class TIME_IN_JAPANESE_TEST

create {ANY}
   make

feature {}
   make
      local
         t: TIME
      do
         t.update
         time_in_japanese.set_time(t)
         time_in_japanese.set_short_mode(False)
         time_in_japanese.set_japanese_calendar_mode(False)
         io.put_string(time_in_japanese.to_string + once "%N")
         time_in_japanese.set_short_mode(False)
         time_in_japanese.set_japanese_calendar_mode(True)
         io.put_string(time_in_japanese.to_string + once "%N")
         time_in_japanese.set_short_mode(True)
         time_in_japanese.set_japanese_calendar_mode(False)
         io.put_string(time_in_japanese.to_string + once "%N")
         time_in_japanese.set_short_mode(True)
         time_in_japanese.set_japanese_calendar_mode(True)
         io.put_string(time_in_japanese.to_string + once "%N")

         time_in_japanese.set_short_mode(False)
         time_in_japanese.set_japanese_calendar_mode(True)
         if t.set(2019, 4, 30, 0, 0, 0) then
            time_in_japanese.set_time(t)
            io.put_string(time_in_japanese.to_string + once "%N")
         end
         if t.set(2019, 5, 1, 0, 0, 0) then
            time_in_japanese.set_time(t)
            io.put_string(time_in_japanese.to_string + once "%N")
         end
         if t.set(1989, 1, 7, 0, 0, 0) then
            time_in_japanese.set_time(t)
            io.put_string(time_in_japanese.to_string + once "%N")
         end
         if t.set(1989, 1, 8, 0, 0, 0) then
            time_in_japanese.set_time(t)
            io.put_string(time_in_japanese.to_string + once "%N")
         end
      end

   time_in_japanese: TIME_IN_JAPANESE
      once
         create Result
      end

end -- class TIME_IN_JAPANESE_TEST
