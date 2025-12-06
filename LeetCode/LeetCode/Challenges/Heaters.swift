// Created 05/09/2024.

import Foundation

//https://leetcode.com/problems/heaters/
struct Heaters {
    
    //Time: O(n log n + m log m) where n is the number of elements in `houses`
    //                           where m is the number of elements in `heaters`
    //Space: O(n + m)
    //array
    //two pointers
    //sorting
    //nested loops
    //
    //Solution Description:
    //By sorting `houses` and `heaters` we can iterate through both in a linear manner using two pointers to find the nearest 
    //heater to a given house. We take `houses` as the outer loop and `heaters` as the inner loop. For any given house (apart
    //from the last house) we want to calculate the distance from it to the two nearest heaters. If the second heater is the
    //nearer heater we increment `p2` and repeat the process until `p2` is pointing at the nearest heater - it doesn't matter
    //if that heater is to the left or the right of house. There is no need to compare the heater we have moved past to any
    //later houses as our sorted arrays ensure that any earlier heaters will be further away from the current house.  As we
    //are going to set all heaters to the same radius we compare this current distance with the `maxRadius`, taking the larger
    //of the two values as `maxRadius`. We repeat this process for all houses. Finally we return `maxRadius`.
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let houses = houses.sorted()
        let heaters = heaters.sorted()
        
        var maxRadius = Int.min
        
        var p1 = 0
        var p2 = 0
        
        while p1 < houses.count {
            while p2 < (heaters.count - 1) { //find the nearest heater
                let distanceToCurrentHeater = abs(houses[p1] - heaters[p2])
                let distanceToNextHeater = abs(houses[p1] - heaters[(p2 + 1)])
                
                guard distanceToCurrentHeater >= distanceToNextHeater else {
                    break
                }
                
                //next heater is closer to current house
                p2 += 1
            }

            let distanceToNearestHeater = abs(houses[p1] - heaters[p2])
            maxRadius = max(maxRadius, distanceToNearestHeater)
            
            p1 += 1
        }
        
        return maxRadius
    }
}
