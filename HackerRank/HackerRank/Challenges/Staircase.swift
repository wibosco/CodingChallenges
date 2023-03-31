//
//  Staircase.swift
//  HackerRank
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/staircase
final class Staircase {

     static func staircase(height: Int) -> String {
        
        var staircaseString = ""
        
        for row in (0..<height).reversed() {
            
            var rowString = ""
            
            for element in 0..<height {
                
                var elementString = ""
                
                if element >= row {
                    
                    elementString = "#"
                }
                else {
                    
                    elementString = " "
                }
                
                rowString = "\(rowString)\(elementString)"
            }
            
            if staircaseString.count > 0 {
                
                staircaseString = "\(staircaseString)\n\(rowString)"
            }
            else {
                
                staircaseString = "\(rowString)"
                
            }
        }
        
        return staircaseString
    }
}
