class Calendar
  MONTHS = %w(January February March April May June July August September October November December)
  def initialize args
    @month = args[0].to_i
    @year = args[1].to_i
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
    first_of_month = Date.new @year, @month
    last_of_month = Date.new @year, @month, -1
    weekday_of_first_of_month = first_of_month.wday
    dates = []
    weekday_of_first_of_month.times {dates << "  "}
    (first_of_month..last_of_month).each do |date|
      dates << "%2i" % date.day
    end
    until dates.empty? do
      #p dates
      output << dates.slice!(0,7).join(' ') << "\n"
    end
    output
  end

  def month_name month_number
    MONTHS[month_number - 1]
  end
end
