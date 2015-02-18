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
    t
  end

  def time_left_in_words_long_version(time)
    t = time_left(time)
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    if t < 0
      '<span class="glyphicon glyphicon-time" ></span><span class="label label-danger">Overdue!</span>'.html_safe
    elsif t < A_DAY
      '<span class="glyphicon glyphicon-time" ></span><span class="label label-warning">%d days, %d hours, %d minutes and %d seconds</span>'.html_safe % [dd, hh, mm, ss]
    else
      '<span class="glyphicon glyphicon-time" ></span><span class="label label-success">%d days, %d hours, %d minutes and %d seconds</span>'.html_safe % [dd, hh, mm, ss]
    end
  end

  def time_left_in_words_short_version(time)
    t = time_left(time)
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    if t < 0
      '<i class="fa fa-clock-o" title="deadline"></i> <span class="label label-danger"> Overdue!</span>'.html_safe
    elsif t < A_DAY
      '<i class="fa fa-clock-o" title="deadline"></i> <span class="label label-warning"> Soon</span>'.html_safe 
    else t > A_DAY
      '<i class="fa fa-clock-o" title="deadline"></i> <span class="label label-success"> Day+</span>'.html_safe 
    end
  end

  def notes_indicator(todo)
    if todo.comments.count == 0
      '<i class="fa fa-comment-o" title="No comments"></i>'.html_safe
    elsif todo.comments.count == 1
      '<i class="fa fa-comment" title="1 Comment"></i>'.html_safe
    else
      '<i class="fa fa-comments" title="Multiple comments"></i>'.html_safe
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
