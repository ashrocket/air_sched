module MailerHelper

  def hour_min_diff(start_date, start_time, end_date, end_time)

    s_time = "#{start_date} #{time_format(start_time)}"
    e_time = "#{end_date} #{time_format(end_time)}"

    diff = Time.diff(s_time, e_time, '%h:%m')
    hours_mins = diff[:diff]
    hours_mins_array = hours_mins.split(':')
    
    {hours: hours_mins_array.first.to_i, mins: hours_mins_array.last.to_i}
  end

  def time_format(time)
    time[0..1] + ":" + time[2..3]  
  end  

  def next_day_connection(s_time, e_time)
    diff = Time.diff(s_time, e_time)
    diff[:day].to_i > 0
  end

end
