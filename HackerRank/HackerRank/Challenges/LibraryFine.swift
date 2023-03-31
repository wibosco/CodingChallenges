//
//  LibraryFine.swift
//  CodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/library-fine
final class LibraryFine {

     static func calculateFine(dueDate: String, expectedDueDate: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"

        let dueDateAsDate = dateFormatter.date(from: dueDate)!
        let expectedDateAsDate = dateFormatter.date(from: expectedDueDate)!

        var fine = 0

        if dueDateAsDate.compare(expectedDateAsDate) == ComparisonResult.orderedDescending {

            let dueDateAsDateComponents = NSCalendar.current.dateComponents([.day, .month, .year], from: dueDateAsDate)
            let expectedDateAsDateComponents = NSCalendar.current.dateComponents([.day, .month, .year], from: expectedDateAsDate)

            if dueDateAsDateComponents.year != expectedDateAsDateComponents.year {

                fine = 10000
            }
            else if dueDateAsDateComponents.month != expectedDateAsDateComponents.month {

                let difference = dueDateAsDateComponents.month! - expectedDateAsDateComponents.month!

                fine = 500 * difference
            }
            else {

                let difference = dueDateAsDateComponents.day! - expectedDateAsDateComponents.day!

                fine = 15 * difference
            }
        }

        return fine
    }
}
