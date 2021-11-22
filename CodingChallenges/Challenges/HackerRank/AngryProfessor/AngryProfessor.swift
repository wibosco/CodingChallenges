//
//  AngryProfessor.swift
//  CodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/angry-professor
class AngryProfessor {
    
     static func shouldCancelClass(studentArrivalTimes: [Int], cancellationThreshold: Int) -> Bool {
        
        var lateStudents = 0
        
        for arrivalTime in studentArrivalTimes {
            
            if arrivalTime > 0 {
                
                lateStudents = lateStudents + 1
            }
        }
        
        return lateStudents > cancellationThreshold
    }
}
