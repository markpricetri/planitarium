module ApplicationHelper
  def formify(times_array)
    return times_array.map { |time| ["#{time}:00", time] }
  end
end
