//
//  NumberOfDaysBetweenTwoDates.swift
//  LeetCode
//
//  Created by William Boles on 15/04/2022.
//

import Foundation

//https://leetcode.com/problems/number-of-days-between-two-dates/
struct NumberOfDaysBetweenTwoDates {
    
    //Time: O(n + m) where n is the difference between 1971 and date year
    //               where m is the difference between January and date month
    //Space: O(1)
    //string
    //math
    //dates
    //
    //Solution Description:
    //The tricky part here is knowing when a year is a leap year. A year is leap year if it is a mulitple of 4, unless it is
    //also a mulitple of 100 unless (again) it is always a multiple of 400. Give that another read - it might be sense the
    //second time. Knowing which year is a leap year means that all that we need to do if work of the number of days from
    //1971-01-01 to the given date for both dates and then get the absolute difference between the days.
    static func daysBetweenDates(_ date1: String, _ date2: String) -> Int {
        return abs(daysSince1971(date1) - daysSince1971(date2))
    }
    
    private static func daysSince1971(_ date: String) -> Int {
        let dateComponents = date.components(separatedBy: "-").map { Int($0)! }
        
        let year = dateComponents[0]
        let month = dateComponents[1]
        let day = dateComponents[2]
        
        var days = day
        
        days += yearInDaysFrom1971(year)
        days += monthInDays(month, year)
        
        return days
    }
    
    private static func yearInDaysFrom1971(_ year: Int) -> Int {
        var total = 0
        
        for i in 1971..<year { //note that we don't include the current year
            if isLeapYear(i) {
                total += 366
            } else {
                total += 365
            }
        }
        
        return total
    }
    
    private static func monthInDays(_ month: Int, _ year: Int) -> Int {
        var days = 0
        for i in 1..<month { //note that we don't include the current month
            switch i {
            case 1, 3, 5, 7, 8, 10, 12:
                days += 31
            case 4, 6, 9, 11:
                days += 30
            case 2:
                days += isLeapYear(year) ? 29 : 28
            default:
                days += 0
            }
        }
        
        return days
    }
    
    private static func isLeapYear(_ year: Int) -> Bool {
        return ((year % 4 == 0) && (year % 100 != 0 || year % 400 == 0))
    }
}
