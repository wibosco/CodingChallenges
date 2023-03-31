//
//  SherlockSquares.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/sherlock-and-squares
final class SherlockSquares {

     static func findCountOfSquaresBetweenARange(lowerBoundary: Int, upperBoundary: Int) -> Int {
//        
//        var count = 0
//        
//        for value in lowerBoundary...upperBoundary {
//            
//            let squareRoot = sqrt(Double(value))
//            
//            if (squareRoot - ceil(squareRoot)) == 0 {
//                
//                count += 1
//            }
//        }
//    
//        return count
        
        //https://en.wikipedia.org/wiki/Intermediate_value_theorem
        return Int(floor(sqrt(Double(upperBoundary))) - ceil(sqrt(Double(lowerBoundary))) + 1)
    }
}
