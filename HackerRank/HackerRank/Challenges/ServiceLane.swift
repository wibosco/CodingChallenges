//
//  ServiceLane.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/service-lane
final class ServiceLane {

     static func largestVechile(servicelane: [Int], entrance: Int, exit: Int) -> Int {
        
        var smallestWidth = 5
        
        for index in entrance...exit {
            
            let width = servicelane[index]
            
            if width < smallestWidth  {
                
                smallestWidth = width
            }
        }
        
        return smallestWidth
    }
}
