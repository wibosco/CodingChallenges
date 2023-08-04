//
//  NonOverlappingIntervals.swift
//  LeetCode
//
//  Created by William Boles on 06/07/2023.
//

import Foundation

//https://leetcode.com/problems/non-overlapping-intervals/
struct NonOverlappingIntervals {
    
    //Time: O(n log n) where n is the number of elements in `intervals`
    //Space: O(n)
    //array
    //sorting
    //
    //Solution Description:
    //By sorting the intervals into ascending order we can reduce the amount of work required to find an overlapping interval
    //as any overlapping intervals will be neighbors. As it's possible for multiple intervals to share an overlap it is not
    //enough to merely compare one neighbour with another neighbour instead we need to compare an interval against the last
    //isolated interval. Where an overlap exists we take "smaller" interval ("smaller" here means the interval with the
    //left-most right boundary) as the one we keep and update `removalCount`. As one interval needs to be removed due the
    //overlap taking the "smaller" interval reduces the choice of it overlapping with it's right neighbor. If there isn't an
    //overlap we update `lastInterval` with the current interval and repeat the process. Once all intervals have been compared
    //and the overlaps removed we return `removalCount`.
    static func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        var removalCount = 0
        var lastInterval = sortedIntervals[0]
        
        for interval in sortedIntervals[1...] {
            if interval[0] < lastInterval[1] { //overlap
                if interval[1] < lastInterval[1] {
                    lastInterval = interval
                }
                
                removalCount += 1
            } else {
                lastInterval = interval
            }
        }
        
        return removalCount
    }
}
