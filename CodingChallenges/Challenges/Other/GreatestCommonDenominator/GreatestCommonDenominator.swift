//
//  GreatestCommonDenominator.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class GreatestCommonDenominator {
    
     static func greatestCommonDenominator(lowest: Int, highest: Int) -> Int {
        
        if lowest == 0 && highest == 0 {
            
            return 0
        }
        
        if lowest > highest{
            
            return 0
        }
        
        if lowest == highest {
            
            return lowest
        }
        
        if highest % lowest == 0 {
            
            return lowest
        }
        
        let lowestUpperBounds = lowest / 2
        
        for index in (0...lowestUpperBounds).reversed() {
            
            if lowest % index == 0 && highest % index == 0 {
                
                return index
            }
        }
        
        return 1
    }
}
