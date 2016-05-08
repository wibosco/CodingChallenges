//
//  TimeConverter.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/time-conversion
class TimeConverter: NSObject {
    
    class func convertFrom12HourTo24HourUsingStringManipulation(time: String) -> String {
        
        let timeComponents = time.characters.split(":").map(String.init)
        
        let secondsWithSuffix = timeComponents[2]
        
        let suffix = String(secondsWithSuffix[secondsWithSuffix.endIndex.advancedBy(-2)...secondsWithSuffix.endIndex.advancedBy(-1)])
        
        var hour = ""
        
        if suffix == "PM" {
            
            if timeComponents[0] == "12" {
                
                hour = timeComponents[0]
            } else {
                
                hour = String(Int(timeComponents[0])! + 12)
            }
        }
        else {
            
            if timeComponents[0] == "12" {
                
                hour = "00"
            }
            else {
                
                hour = timeComponents[0]
            }
        }
        
        let seconds = String(secondsWithSuffix[secondsWithSuffix.startIndex.advancedBy(0)...secondsWithSuffix.startIndex.advancedBy(1)])
        
        return "\(hour):\(timeComponents[1]):\(seconds)"
    }
    
    class func convertFrom12HourTo24HourUsingDateManipulation(time: String) -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm:ssa"
        
        let date12 = dateFormatter.dateFromString(time)
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let date24 = dateFormatter.stringFromDate(date12!)
        
        return date24
    }
}
