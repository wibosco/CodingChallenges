//
//  MergeIntervals.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-intervals/
struct MergeIntervals {
    
    //Time: O(n log n) where n is the number of intervals
    //Space: O(n) where n is the number of intervals (we copy the `intervals` array to sort it)
    //array
    //sorting
    //intervals
    //
    //Solution Description:
    //By sorting the intervals into ascending order we can reduce the amount of work required to find an overlapping interval
    //as any overlapping intervals will be neighbors. As it's possible for multiple intervals to share an overlap it is not
    //enough to merely compare one neighbour with another neighbour instead we need to compare an interval against the last
    //already merged interval. Where an overlap exists we take the max upper boundary of the two intervals that are to be
    //merged and set that as the merged intervals upper boundary - the lower boundary never changes as it is either less than
    //or equal to the interval-to-be-merged lower boundary. If there isn't an overlap we add the interval to the
    //`mergedIntervals` array. Once all intervals have been compared we return the `mergedIntervals` array.
    static func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals
        }
        
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] } // n log n
        
        var mergedIntervals = [intervals[0]] //seed with the first interval
        
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
