//
//  TimeInWords.swift
//  CodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/the-time-in-words
class TimeInWords {

     static func timeInWords(hour: Int, minute: Int) -> String {
        
        var timeInWords = ""
        
        if minute <= 30 {
            
            let hourAsWord = TimeInWords.numericUnitToWordUnit(unit: hour)
            
            if minute == 0 {
                
                timeInWords = "\(hourAsWord) o' clock"
            }
            else if minute == 15 {
                
                timeInWords = "quarter past \(hourAsWord)"
            }
            else if minute == 30 {
                
                timeInWords = "half past \(hourAsWord)"
            }
            else {
                
                if minute == 1 {
                    
                    timeInWords = "one minute past \(hourAsWord)"
                }
                else {
                    
                    let minuteAsWord = TimeInWords.numericUnitToWordUnit(unit: minute)
                    
                    timeInWords = "\(minuteAsWord) minutes past \(hourAsWord)"
                }

            }
        }
        else {
            
            let nextHourAsWord = TimeInWords.numericUnitToWordUnit(unit: TimeInWords.nextHour(hour: hour))
            
            if minute == 45 {
                
                timeInWords = "quarter to \(nextHourAsWord)"
            }
            else {
                
                if minute == 59 {
                    
                    timeInWords = "one minute to \(nextHourAsWord)"
                }
                else {
                    
                    let minuteToValue = 60 - minute
                    
                    let minuteAsWord = TimeInWords.numericUnitToWordUnit(unit: minuteToValue)
                    
                    timeInWords = "\(minuteAsWord) minutes to \(nextHourAsWord)"
                }
            }
        }
        
        return timeInWords
    }
    
     static func nextHour(hour: Int) -> Int {
        
        var nextHour = 1
        
        if hour != 12 {
            
            nextHour = hour + 1
        }
        
        return nextHour
    }
    
     static func numericUnitToWordUnit(unit: Int) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        
        let formattedNumber = numberFormatter.string(from: NSNumber(value: unit))!
        
        return formattedNumber.replacingOccurrences(of: "-", with: " ")
    }
}
