// Created 14/03/2022.

import Foundation

//https://leetcode.com/problems/insert-interval/
struct InsertInterval {
    
    //Time: O(m) where m is the new `intervals` array containing `newInterval`
    //Space: O(m + k) where m is the new `intervals` array containing `newInterval`
    //                where k is the merged intervals array
    //array
    //sorted
    //intervals
    //
    //Solution Description:
    //First we insert `newInterval` into our mutable `intervals` copy. We do this by finding the first index that has a larger
    //lower value than the lower value of `newInterval` and we insert `newInterval` directly before this interval. As we are
    //only inserting one interval we can then break our loop after the insertion. If however we reach the end of `intervals`
    //without inserting `newInterval` then we know that `newInterval` is greater than all other intervals and we need to add
    //it to the end of `intervals`. Next we need to merge any overlapping intervals. As it's possible for multiple intervals
    //to share an overlap it is not enough to merely compare one neighbour with another neighbour instead we need to compare
    //an interval against the last already merged interval. Where an overlap exists we (potentially - sometime the
    //interval-to-be-merged's upper is less than the current merged intervals upper boundary) push out the merged intervals
    //upper boundary to accommodate this new upper boundary (lower boundary never changes as it is either less than or equal
    //to the interval-to-be-merged lower boundary). If there isn't an overlap we add the interval to the `mergedIntervals`
    //array. Once all intervals have been compared we return the `mergedIntervals` array.
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var intervals = intervals
        var insertedNewInterval = false
        
        for i in 0..<intervals.count {
            let interval = intervals[i]
            
            if interval[0] >= newInterval[0] {
                intervals.insert(newInterval, at: i)
                insertedNewInterval = true
                break
            }
        }
        
        if !insertedNewInterval {
            intervals.append(newInterval)
        }
        
        var mergedIntervals = [[Int]]()
        mergedIntervals.append(intervals[0])
        
        for i in 1..<intervals.count {
            let interval = intervals[i]
            let mergedInterval = mergedIntervals.last!
            
            if mergedInterval[1] >= interval[0] {
                mergedIntervals[(mergedIntervals.count - 1)][1] = max(mergedInterval[1], interval[1])
            } else {
                mergedIntervals.append(interval)
            }
        }
        
        return mergedIntervals
    }
}
