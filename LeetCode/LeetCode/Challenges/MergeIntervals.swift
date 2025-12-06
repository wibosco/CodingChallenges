// Created 15/11/2021.

import Foundation

//https://leetcode.com/problems/merge-intervals/
struct MergeIntervals {
    
    //Time: O(n log n) where n is the number of intervals
    //Space: O(n) where n is the number of intervals (we copy the `intervals` array to sort it)
    //array
    //sorting
    //intervals
    //fast forward
    //
    //Solution Description:
    //Solution Description:
    //By sorting the intervals into ascending order we can reduce the amount of work required to find an overlapping interval
    //as any overlapping intervals will be neighbors. As it's possible for multiple intervals to share an overlap it is not
    //enough to merely compare one neighbour with another neighbour instead we need to compare an interval against the last
    //already merged interval. Where an overlap exists we take the max upper boundary of the two intervals that are to be
    //merged and set that as the merged intervals upper boundary - the lower boundary never changes as it is either less than
    //or equal to the interval-to-be-merged lower boundary. If there isn't an overlap we add the interval to the
    //`mergedIntervals` array. Once all intervals have been compared we return the `mergedIntervals` array.
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })

        var mergedIntervals = [[Int]]()
        var p1 = 0

        while p1 < sortedIntervals.count {
            let start = sortedIntervals[p1][0]
            var end = sortedIntervals[p1][1]

            var p2 = (p1 + 1)
            while p2 < sortedIntervals.count {
                guard sortedIntervals[p2][0] <= end else {
                    break
                }

                end = max(end, sortedIntervals[p2][1])
                p2 += 1
            }

            mergedIntervals.append([start, end])
            p1 = p2
        }

        return mergedIntervals
    }
    
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
    func merge2(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals
        }
        
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] } // n log n
        
        var mergedIntervals = [intervals[0]] //seed with the first interval
        
        for interval in intervals[1...] {
            let mergedInterval = mergedIntervals.last!
            
            //as intervals is sorted by the start index we don't need to compare that
            if mergedInterval[1] >= interval[0] {
                //Only the max can change as we already sorted on the on the min value
                let upper = max(interval[1], mergedInterval[1])
                mergedIntervals[(mergedIntervals.count - 1)][1] = upper
            } else {
                //new interval
                mergedIntervals.append(interval)
            }
        }
        
        return mergedIntervals
    }
}
