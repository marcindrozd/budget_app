module ApplicationHelper
  def recurrence_array
    [['one time expense', 0], ['every month', 1], ['every 2 months', 2], ['every 3 months', 3], ['every 4 months', 4], ['every 5 months', 5], ['every 6 months', 6]]
  end

  def months_array
    [['January', 1],['February', 2], ['March', 3], ['April', 4], ['May', 5], ['June', 6], ['July', 7],
    ['August', 8], ['September', 9], ['October', 10], ['November', 11], ['December', 12]]
  end

  def add_table_class(item)
    if item.paid
      "success"
    elsif Date.today > item.due_date
      "danger"
    elsif Date.tomorrow == item.due_date
      "warning"
    else
      ""
    end
  end
end

