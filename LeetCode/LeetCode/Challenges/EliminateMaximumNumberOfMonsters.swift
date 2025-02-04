//
//  EliminateMaximumNumberOfMonsters.swift
//  LeetCode
//
//  Created by William Boles on 07/11/2023.
//

import Foundation

//https://leetcode.com/problems/eliminate-maximum-number-of-monsters/
struct EliminateMaximumNumberOfMonsters {
    
    //Time: O(n log n) where n is the number of elements in either `dist` or `speed`
    //Space: O(n)
    //array
    //sorting
    //greedy
    //inverted thinking
    //
    //Solution Description:
    //Rather than attempt to "move" the monsters toward the city we instead determine how long it would take each monster to reach
    //the city without attempting eliminate any and store those values in `arrivalTimes`. We sort `arrivalTimes` in ascending order
    //to allow us to eliminate the most pressing monsters first in a greedy manner. As we can only eliminate one monster at a time
    //we can treat each iteration of `arrivalTimes` as a move forward in time. If at any point `timeToArrive` is less than
    //`currentTime` then that monster was able to reach the city before it could be eliminated and we immediately return with the
    //current index as the result; if however `timeToArrive` is always equal to or greater than `shots` then we can eliminate all
    //monsters before they reach the city.
    //
    //N.B. this is kind of like a BFS level-by-level approach however because the monsters don't interfere with each other and we
    //need to eliminate the monsters that reach the city first rather than just the nearer monsters, we are able to calculate the
    //monsters moves and eliminate them in a greedy manner which is much simpler/efficient than the alternative BFS approach.
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let monsters = dist.count
        var arrivalTimes = [Int]()
                
        for i in 0..<monsters {
            let location = Double(dist[i])
            let movement = Double(speed[i])
            
            let arrivalTime = ceil((location / movement))
            
            arrivalTimes.append(Int(arrivalTime))
        }
        
        arrivalTimes.sort { $0 < $1 }

        for (currentTime, timeToArrive) in arrivalTimes.enumerated() {
            if currentTime >= timeToArrive {
                return currentTime
            }
        }
        
        return monsters
    }
}
