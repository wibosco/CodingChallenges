// Created 03/11/2023.

import Foundation

//https://leetcode.com/problems/remove-covered-intervals/
struct RemoveCoveredIntervals {
    
    //Time: O(n log n) where n is the number of elements in `intervals`
    //Space: O(n)
    //array
    //intervals
    //sorting
    //multi-property sorting
    //
    //Solution Description:
    //First we sort `intervals` so that any potentially "covered" intervals are now neighbors allowing for a linear
    //traversal and "closing". Sorting happens in two stages, first we attempt to sort by ascending left-most value, if
    //two intervals have the same left-most value we then sort by descending right-most value - this way we ensure that
    //the largest intervals come first in `sortedIntervals` which will allow that larger interval to "close" the smaller
    //overlapping intervals. Next we iterate through `intervals` and compare the current interval (`interval`) with the
    //most rightward interval (`lastInterval`) we have seen so far. If the current interval in within the range of the
    //rightward interval we can cover that interval - note we don't actually cover the interval instead we just increment
    //`count` which is used to mimic the covering action; if the current interval is not within the range of the
    //rightward interval we replace `lastInterval` with `interval`. We the subtract the count value from the starting
    //interval to determine how many intervals are left.
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        //sort so that the left-most starting value is first and if they are equal, sort by the right-most ending
        //value so the "longer" interval is first
        let sortedIntervals = intervals.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            
            return $0[0] < $1[0]
        }
        
        var lastInterval = sortedIntervals[0]
        var count = 0

        for interval in sortedIntervals[1...] {
            if interval[0] >= lastInterval[0] && interval[1] <= lastInterval[1] {
                count += 1 //not need to remove covered interval as it will be no longer is used
            } else {
                lastInterval = interval
            }
        }
        
        return sortedIntervals.count - count
    }
}
