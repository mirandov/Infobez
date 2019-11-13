module ApplicationHelper
  def date_ru(date)
    date = date.to_s.split("-")[2] + "." + date.to_s.split("-")[1] + "." + date.to_s.split("-")[0]
    return date
  end
end
