//
//  MergeIntervals.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-intervals/
//sorting
struct MergeIntervals {
    
    //Time: O(n log n)
    static func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals
        }
        
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] }
        
        var mergedIntervals = [intervals[0]]
        
        for i in 1..<intervals.count {
            let comparisonInterval = intervals[i]
            let mergedInterval = mergedIntervals.last!
            if mergedInterval[1] >= comparisonInterval[0] {
                //Only the max can change as we already sorted on the on the min value
                mergedIntervals[(mergedIntervals.count - 1)][1] = max(comparisonInterval[1], mergedInterval[1])
            } else {
                mergedIntervals.append(comparisonInterval)
            }
        }
        
       return mergedIntervals
    }
}
