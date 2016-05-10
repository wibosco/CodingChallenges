//
//  LibraryFine.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/library-fine
class LibraryFine: NSObject {

    class func calculateFine(dueDate: String, expectedDueDate: String) -> Int {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        
        let dueDateAsDate = dateFormatter.dateFromString(dueDate)!
        let expectedDateAsDate = dateFormatter.dateFromString(expectedDueDate)!
        
        var fine = 0
        
        if dueDateAsDate.compare(expectedDateAsDate) == NSComparisonResult.OrderedDescending {
            
            let dueDateAsDateComponents = NSCalendar .currentCalendar().components([.Day, .Month, .Year], fromDate: dueDateAsDate)
            let expectedDateAsDateComponents = NSCalendar .currentCalendar().components([.Day, .Month, .Year], fromDate: expectedDateAsDate)
            
            if dueDateAsDateComponents.year != expectedDateAsDateComponents.year {
                
                fine = 10000
            }
            else if dueDateAsDateComponents.month != expectedDateAsDateComponents.month {
                
                let difference = dueDateAsDateComponents.month - expectedDateAsDateComponents.month
                
                fine = 500 * difference
            }
            else {
                
                let difference = dueDateAsDateComponents.day - expectedDateAsDateComponents.day
                
                fine = 15 * difference
            }
        }
        
        return fine
    }
}
