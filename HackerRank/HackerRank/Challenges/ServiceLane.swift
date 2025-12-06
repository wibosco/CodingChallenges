// Created 08/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/service-lane
final class ServiceLane {

     static func largestVehicle(servicelane: [Int], entrance: Int, exit: Int) -> Int {
        
        var smallestWidth = 5
        
        for index in entrance...exit {
            
            let width = servicelane[index]
            
            if width < smallestWidth {
                
                smallestWidth = width
            }
        }
        
        return smallestWidth
    }
}
