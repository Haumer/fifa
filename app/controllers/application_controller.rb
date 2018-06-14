class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def localDateFromUTC(s)

    x = s.split(/[-\s:tz]/i);
    d = new Date();

    d.setUTCFullYear(x[0], x[1], x[2]);
    d.setUTCHours(x[3], x[4], x[5]);
    return d;
  end

end
