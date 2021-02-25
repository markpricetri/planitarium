module ApplicationHelper
  def formify(times_array)
    # return times_array.map { |time| ["#{time}:00", time] }
    return times_array.map { |time| [time_formatter(time), time] }

  end

  # time formatter helper, where a string is returned depending on the hour integer arguement
  def time_formatter(hour)
    if hour >= 12 && hour <= 24
      hour == 12 ? twelve_hr = hour : twelve_hr = (hour - 12)
      return "#{hour}:00 (#{twelve_hr} pm)"
    else
      return "#{hour}:00 am"
    end
  end

  # remaining seats helper, where a string is returned indicating availability for a show
  def remaining_seats(show)
    booked = 0
    Booking.where(show_id: show.id).each do |booking|
      booked += booking.no_of_people
    end
    remaining = show.capacity - booked
    return remaining > 0 ? "Available Seats - #{remaining}" : "SOLD OUT!"
  end
end
