module SessionsHelper

  def flash_class(level)
    case level
      when :notice then 'notice'
      when :danger then 'danger'
    end
    level
  end
end
