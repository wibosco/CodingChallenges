//
//  ServiceLane.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/service-lane
class ServiceLane: NSObject {

    class func largestVechile(servicelane: [Int], entrance: Int, exit: Int) -> Int {
        
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
