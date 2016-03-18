import Foundation

/* Problem 19

You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

*/

var firstSundayCount = 0

enum Month: Int {
    case January = 1
    case February, March, April, May, June, July, August, September, October, November, December
    
    func numberOfDays(year: Int) -> Int {
        switch self {
        case .January, .March, .May, .July, .August, .October, .December:
            return 31
        case .April, .June, .September, .November:
            return 30
        case .February:
            if year % 400 == 0 { return 29 }
            if year % 100 == 0 { return 28 }
            if year % 4 == 0 { return 29 }
            return 28
        }
    }
    
    func next() -> Month {
        if self.rawValue == 12 {
            return .January
        } else {
            return Month(rawValue: self.rawValue + 1)!
        }
    }
}

struct Date {
    var currentDay: Int
    var currentMonth: Month
    var current2DigitYear: Int
    var currentCentury: Int
    
    mutating func nextDay() {
        if currentDay == 1 {
            if dayOfTheWeek(1, month: currentMonth.rawValue, year: current2DigitYear, century: currentCentury) == 1 {
                firstSundayCount += 1
            }
        }
        currentDay += 1
        if currentDay > currentMonth.numberOfDays(currentCentury + current2DigitYear) {
            currentDay = 1
            currentMonth = currentMonth.next()
            if currentMonth == .January {
                current2DigitYear += 1
            }
        }
        if current2DigitYear > 99 {
            current2DigitYear = 0
            currentCentury += 100
        }
    }
    
    func isLeapYear() -> Bool {
        return ((current2DigitYear % 4) == 0) && !(currentCentury % 400 == 0)
    }
}

func namedDayOfTheWeek(day: Int, month: Int, year: Int, century: Int) -> String {
    let answer:Int = dayOfTheWeek(day, month: month, year: year, century: century)
    switch answer {
    case 0:     return "Saturday"
    case 1:     return "Sunday"
    case 2:     return "Monday"
    case 3:     return "Tuesday"
    case 4:     return "Wednesday"
    case 5:     return "Thursday"
    case 6:     return "Friday"
    default:    return "ERROR"
    }
}

func dayOfTheWeek(day: Int, month: Int, year: Int, century: Int) -> Int {
    let c = century % 4
    let answer = ( day + month + year + c + Int(year/4) ) % 7
    switch answer {
    case 0:     return 7
    case 1:     return 1
    case 2:     return 2
    case 3:     return 3
    case 4:     return 4
    case 5:     return 5
    case 6:     return 6
    default:    return 0
    }
}

// Function Check
namedDayOfTheWeek(17, month: 3, year: 16, century: 2000)

// Though you can easily use the date functions to be more clever, I wanted to stick with the spirit of things and step through each day
var date = Date(currentDay: 1, currentMonth: Month.January, current2DigitYear: 01, currentCentury: 1900)
print(date)
// Go 100 Years into the future minus 1 day
for _ in 1...99 {
    if date.isLeapYear() {
        date.nextDay()
    }
    for _ in 1...364 {
        date.nextDay()
    }
}
if date.isLeapYear() {
    date.nextDay()
}
for _ in 1...363 {
    date.nextDay()
}
print(date)
print(firstSundayCount)


// CORRECT ANSWER: 171
