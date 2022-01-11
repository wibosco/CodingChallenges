//
//  MergeIntervals.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-intervals/
//array
struct MergeIntervals {
    
    //Time: O(n log n) where `n` is the number of intervals
    //Space: O(n) where `n` is the number of intervals
    //sorting
    //
    //Solution Description:
    //Sorting the intervals into ascending order, this way we only need compare any given interval with it's
    //immediate, already merged predecessor to determine if this inteval is a new distant interval or a
    //continuation of that predecessor interval
    static func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals
        }
        
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] } // n log n
        
        var mergedIntervals = [intervals[0]]
        
        for i in 1..<intervals.count {
            let comparisonInterval = intervals[i]
            let mergedInterval = mergedIntervals.last!
            
            if mergedInterval[1] >= comparisonInterval[0] {
                //Only the max can change as we already sorted on the on the min value
                let upper = max(comparisonInterval[1], mergedInterval[1])
                mergedIntervals[(mergedIntervals.count - 1)][1] = upper
            } else {
                //new interval
                mergedIntervals.append(comparisonInterval)
            }
        }
        
       return mergedIntervals
    }
}
