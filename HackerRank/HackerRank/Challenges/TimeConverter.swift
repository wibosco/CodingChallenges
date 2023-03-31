//
//  TimeConverter.swift
//  HackerRank
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/time-conversion
final class TimeConverter {
    
     static func convertFrom12HourTo24HourUsingDateManipulation(time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm:ssa"
        
        let date12 = dateFormatter.date(from: time)
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let date24 = dateFormatter.string(from: date12!)
        
        return date24
    }
}
