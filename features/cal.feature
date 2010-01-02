Feature: Calendar utility

  Scenario: Single month view, with month and year specified
    When I run "cal 1 2010"
    Then I should see:
    """
       January 2010
    Su Mo Tu We Th Fr Sa
                    1  2
     3  4  5  6  7  8  9
    10 11 12 13 14 15 16
    17 18 19 20 21 22 23
    24 25 26 27 28 29 30
    31

    """

  Scenario: Single month view (far past), with month and year specified
    When I run "cal 12 1845"
    Then I should see:
    """
       December 1845
    Su Mo Tu We Th Fr Sa
        1  2  3  4  5  6
     7  8  9 10 11 12 13
    14 15 16 17 18 19 20
    21 22 23 24 25 26 27
    28 29 30 31

    """
