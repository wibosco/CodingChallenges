//
//  TimeInWords.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class TimeInWords: NSObject {

    class func timeInWords(hour: Int, minute: Int) -> String {
        
        var timeInWords = ""
        
        if minute <= 30 {
            
            let hourAsWord = TimeInWords.numericUnitToWordUnit(hour)
            
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
                    
                    let minuteAsWord = TimeInWords.numericUnitToWordUnit(minute)
                    
                    timeInWords = "\(minuteAsWord) minutes past \(hourAsWord)"
                }

            }
        }
        else {
            
            let nextHourAsWord = TimeInWords.numericUnitToWordUnit(TimeInWords.nextHour(hour))
            
            if minute == 45 {
                
                timeInWords = "quarter to \(nextHourAsWord)"
            }
            else {
                
                if minute == 59 {
                    
                    timeInWords = "one minute to \(nextHourAsWord)"
                }
                else {
                    
                    let minuteToValue = 60 - minute
                    
                    let minuteAsWord = TimeInWords.numericUnitToWordUnit(minuteToValue)
                    
                    timeInWords = "\(minuteAsWord) minutes to \(nextHourAsWord)"
                }
            }
        }
        
        return timeInWords
    }
    
    class func nextHour(hour: Int) -> Int {
        
        var nextHour = 1
        
        if hour != 12 {
            
            nextHour = hour + 1
        }
        
        return nextHour
    }
    
    class func numericUnitToWordUnit(unit: Int) -> String {
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .SpellOutStyle
        
        let formattedNumber = numberFormatter.stringFromNumber(unit)!
        
        return formattedNumber.stringByReplacingOccurrencesOfString("-", withString: " ")
    }
}
