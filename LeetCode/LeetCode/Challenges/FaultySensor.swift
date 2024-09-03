//
//  FaultySensor.swift
//  LeetCode
//
//  Created by William Boles on 03/09/2024.
//

import Foundation

//https://leetcode.com/problems/faulty-sensor/
struct FaultySensor {
    
    //Time: O(n) where n is the number of elements in either `sensor1` or `sensor2`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //As we know `sensor1` and `sensor2` has the same we can iterate through them both using the same pointer but this is a two
    //pointer solution due to offsetting of indexes. As we iterate we compare the values we encounter: - if they match we keep
    //going; if they don't match we need to examine the values. First we check if offseting both `sensor1` and `sensor2` result
    //in the same pattern when compared the the current `sensor1` and `sensor2` values - if the patterns match then we can't
    //yet determine which sensor's data is bad as both offsets appear valid and we need to keep iterating.If the patterns don't
    //match then we can determine which sensor's data is bad by determining which offset doesn't match and returning that sensor.
    //Finally if we iterate through all elements then we return -1 as they either match or the mismatch occured on the final
    //element.
    func badSensor(_ sensor1: [Int], _ sensor2: [Int]) -> Int {
        let length = sensor1.count
        var i = 0
        
        while i < (length - 1) { //no need to compare the final element
            if sensor1[i] != sensor2[i] {
                if sensor1[i] == sensor2[(i + 1)] && sensor1[(i + 1)] == sensor2[i] {
                    //can't yet determine which sensor is bad due to offset value pattern matching in both sensor so keep iterating
                    i += 1
                } else {
                    //there is a mismatch in the offset patterns so we can determine which sensor is bad
                    if sensor1[i] == sensor2[(i + 1)] {
                        //offsetting sensor2 results in a match with sensor1 values but offseting sensor1 doesn't match
                        return 1
                    } else if sensor1[(i + 1)] == sensor2[i] {
                        //offsetting sensor1 results in a match with sensor2 values but offseting sensor2 doesn't match
                        return 2
                    }
                }
            } else {
                i += 1
            }
        }

        return -1
    }
}
