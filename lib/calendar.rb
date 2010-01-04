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
    <<EOF
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOF
  end

  def month_name month_number
    MONTHS[month_number - 1]
  end
end
