//
//  GasStation.swift
//  LeetCode
//
//  Created by William Boles on 29/03/2022.
//

import Foundation

//https://leetcode.com/problems/gas-station/
//array
struct GasStation {
    
    //Time: O(n) `n` is the number of elements in either `gas`
    //Space: O(1)
    //counting
    //greedy
    //
    //Solution Description:
    //In order for a circuit of the gas stations to be possible there needs to be more gas available than it costs to
    //move between the stations i.e. sum(gas) >= sum(cost). Knowing how to determine if a circuit is possible we can then
    //take a greedy approach to finding the potential starting station - as we iterate through `gas` if at any time our
    //tank (`currentGas`) slips below 0 then we know that any station before the current station can't be the starting
    //station so we take the current station as the new starting station and continue iterating. After iterating through
    //all elements in `gas` we check if it is possible to make a full circuit (`totalGasCostDelta >= 0`). If a full
    //circuit can be made then we return the `startingStation`; if not we return -1
    //
    //N.B. while it might not be possible to get to station `i` from 0 i.e. [0..i], it might be possible to get there by
    //going [(i + 1)...0...i] as any unused gas is carried forward in the tank
    static func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var currentGas = 0
        var totalGasCostDelta = 0
        var startingStation = 0
        
        for i in 0..<gas.count {
            currentGas += (gas[i] - cost[i])
            totalGasCostDelta += (gas[i] - cost[i])
            
            if currentGas < 0 {
                currentGas = 0
                startingStation = (i + 1) //can't station is reachable without more gas so update the starting station
            }
        }
    
        return totalGasCostDelta >= 0 ? startingStation : -1
    }
    
    //Time: O(n^2) `n` is the number of elements in either `gas` or `cost`
    //Space: O(1)
    //nested loops
    //modulo
    //
    //Solution Description:
    //First we select an element from `gas` and then using `cost` attempt to get back to that `gas` element. If at any
    //point `tank` drops below 0 then we know that it isn't possible to get back to our `gas` element and we move onto
    //the next `gas` element. As the final both `gas` and `cost` wrap round from end..start we need to performa modulo
    //operation on the inner loop variable - `j`
    static func canCompleteCircuitNestedLoops(_ gas: [Int], _ cost: [Int]) -> Int {
        for i in 0..<gas.count {
            var tank = 0
            var j = i
            var travelled = false
        
            while tank >= 0 {
                j = (j % cost.count)
                
                if travelled && j == i {
                   return i
                }
            
                tank += (gas[j] - cost[j])
                travelled = true
                
                j += 1
            }
        }
        
        return -1
    }
}
