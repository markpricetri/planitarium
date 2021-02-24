module ApplicationHelper
  def formify(times_array)
    return times_array.map { |time| ["#{time}:00", time] }
  end

  def time_formatter(hour)
    if hour >= 12 && hour <= 24
      hour == 12 ? twelve_hr = hour : twelve_hr = (hour - 12)
      return "#{hour}:00 (#{twelve_hr} pm)"
    else
      return "#{hour}:00 am"
    end
  end
end
