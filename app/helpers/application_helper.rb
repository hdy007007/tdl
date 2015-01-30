module ApplicationHelper
  A_DAY = 86400 # 86,400 seconds in a day
  
  def lights(time)
    t = time - Time.now
    if t < 0
      :red
    elsif t < 86400
      :amber
    else
      :green
    end
  end

  def time_left(time)


    t = time - Time.now
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    if t < 0
      '<span class="label label-danger">Overdue!</span>'.html_safe
    elsif t < A_DAY
      '<span class="label label-warning">%d days, %d hours, %d minutes and %d seconds</span>'.html_safe % [dd, hh, mm, ss]
    else
      '<span class="label label-success">%d days, %d hours, %d minutes and %d seconds</span>'.html_safe % [dd, hh, mm, ss]
    end
  end

    def time_ago(datetime)
    seconds = (Time.now - datetime).to_i
    mm, ss = seconds.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    if dd == 0 && hh == 0 && mm == 0
      "%d #{'second'.pluralize(ss)}" % [ss]
    elsif dd == 0 && hh == 0
      "%d #{'minute'.pluralize(mm)} and %d #{'second'.pluralize(ss)}" % [mm, ss]
    elsif dd == 0
      "%d #{'hour'.pluralize(hh)}, %d #{'minute'.pluralize(mm)} and %d #{'second'.pluralize(ss)}" % [hh, mm, ss]
    else      
      "%d #{'days'.pluralize(dd)}, %d #{'hour'.pluralize(hh)}, %d #{'minute'.pluralize(mm)} and %d #{'second'.pluralize(ss)}" % [dd, hh, mm, ss]      
    end
    
  end
end
