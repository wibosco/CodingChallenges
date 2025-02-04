//
//  CarFleet.swift
//  LeetCode
//
//  Created by William Boles on 07/05/2023.
//

import Foundation

//https://leetcode.com/problems/car-fleet/
struct CarFleet {
    
    //Time: O(n log n) where n is either the `position` elements or `speed` elements
    //Space: O(n)
    //array
    //sorting
    //stack
    //monotonic decreasing stack
    //
    //Solution Description:
    //As cars can not overtake each other, any car that catches another car is slowed down and treated as a fleet. Due to
    //the lack of overtaking, start position is important so first we sort the cars - `sortedByPosition`, and iterate
    //through `sortedByPosition` in reverse order to determine when a car will reach `target`. Using a monotonic
    //decreasing stack we can combine cars that catch each other into the slowest car's time and so get the fleet. By
    //going in reverse order we ensure that if the current car doesn't reach the `target` at the same time as a fleet
    //already in the stack then no quicker leftwards car will be able to (as the current car will slow that quicker car
    //down).
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing
    //when it follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let combined = zip(position, speed)
        //as cars can't overtake want to build car fleets by reverse starting position order
        let sortedByPosition = combined.sorted { $0.0 < $1.0 }
        
        var stack = [Double]() //monotonic decreasing stack
        
        for (position, speed) in sortedByPosition.reversed() {
            //determine when the current car reaches the target
            let currentCarTime = Double((target - position)) / Double(speed)
            
            guard let carInFrontTime = stack.last else {
                stack.append(currentCarTime)
                
                continue
            }
            
            //check if the current car reaches the target at the same time as the car in front. If it doesn't we add
            //it; if it does the existing car in the stack is slower so we discard the time of the current car
            if carInFrontTime < currentCarTime {
                stack.append(currentCarTime)
            }
        }
        
        return stack.count
    }
}
