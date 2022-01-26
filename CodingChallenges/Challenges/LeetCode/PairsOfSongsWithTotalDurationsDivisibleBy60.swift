//
//  PairsOfSongsWithTotalDurationsDivisibleBy60.swift
//  CodingChallenges
//
//  Created by William Boles on 22/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
//array
struct PairsOfSongsWithTotalDurationsDivisibleBy60 {
    
    //Time: O(n) where `n` is the number of elements in `time`
    //Space: O(1) reminders will contain a maximum of 60 entries
    //dictionary
    //
    //Solution Description:
    //Store the reminder of each `time % 60` in a dictionary as the key and how many times have that reminder as the value. This allows
    //O(1) access time when checking if that reminder exists when attempting to find a pair for a future song. The trick here is that
    //when attempting to find that pair we need to not search for the reminder directly but rather search for the difference between
    //60 and that reminder because that difference is what we need to fulfill the requirement that paired songs need to be
    //"(i + j) % 60 == 0"
    //
    //Similar to https://leetcode.com/problems/two-sum/
    static func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var reminders = [Int: Int]()
        var pairs = 0
        
        for t in time {
            let reminder = t % 60
            let key = (60 - reminder) % 60 // get what needs to be added to the reminder to get to `x % 60 == 0`
            
            if let count = reminders[key] {
                pairs += count
            }
            
            reminders[reminder, default: 0] += 1 // store this reminder so it can be used in the future
        }
        
        return pairs
    }
}
