// Created 07/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/angry-professor
final class AngryProfessor {
    
     static func shouldCancelClass(_ studentArrivalTimes: [Int], _ cancellationThreshold: Int) -> Bool {
        var lateStudents = 0
        
         for arrivalTime in studentArrivalTimes {
            if arrivalTime > 0 {
                lateStudents += 1
            }
        }
        
        return lateStudents > cancellationThreshold
    }
}
