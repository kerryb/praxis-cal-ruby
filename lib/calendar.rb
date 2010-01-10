require 'date'

class Calendar
  MONTHS = %w(January February March April May June July August September October November December)
  def initialize args
    if args.empty?
      now = Time.now
      @month, @year = now.month, now.year
    else
      @month, @year = args[0].to_i, args[1].to_i
    end
  end

  def output
    header + month
  end

  private

  def header
    "   #{month_name(@month)} #{@year}\n"
  end

  def month
    output = "Su Mo Tu We Th Fr Sa\n"
    first_of_month = Date.new @year, @month, 1, Date::ENGLAND
    last_of_month = Date.new @year, @month, -1, Date::ENGLAND
    dates = []
    first_of_month.wday.times {dates << 0}
    (first_of_month..last_of_month).each do |date|
      dates << date.day
    end
    until dates.empty? do
      output << dates.slice!(0,7).map{|d| d.zero? ? "  " : "%2i" % d}.join(' ') << "\n"
    end
    output
  end

  def month_name month_number
    MONTHS[month_number - 1]
  end
end
