// Created 05/12/2025.

import Foundation

//https://leetcode.com/problems/maximum-distance-in-arrays/
struct MaximumDistanceInArrays {
    
    //Time: O(n) where n is the number of elements in `arrays`
    //Space: O(1)
    //array
    //minimum
    //maximum
    //
    //Solution Description:
    //The difficulty here that we need to take the min and max values from different arrays. Where the same array contains both the
    //min and max we don't know which one to take to ensure the max distance is calculated. Instead of choosing which one to take
    //we take both. We then use both to calculate `maxDistance` but we use them with the min and max values from current array. This
    //ensures that when calculating `maxDistance`, the min and max that we use are from different arrays. As we tracking two values
    //we calculate and (potentally) set `maxDistance` twice. Only after `maxDistance` do we then compare the global min and max
    //against the current min and max - taking the larger/smaller value. The ordering here is important. We repeat this process for
    //all elements in `arrays` and then return `maxDistance`.
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var globalMin = arrays[0][0]
        var globalMax = arrays[0][(arrays[0].count - 1)]

        var maxDistance = 0

        for a in arrays[1...] { //start from 1 as 0 was used to set up `globalMin` and `globalMax`.
            let currentMin = a[0]
            let currentMax = a[(a.count - 1)]

            //note, how `globalMin` and `globalMax` never directly interact to calculate `maxDistance` so even if they are
            //from the same array they are always used with values from a different array.
            maxDistance = max(maxDistance, (currentMax - globalMin))
            maxDistance = max(maxDistance, (globalMax - currentMin))
            
            //note, how we update `globalMin` and `globalMax` after we calculate `maxDistance` to ensure that different
            //array are interacting to calculate `maxDistance`.
            globalMin = min(globalMin, currentMin)
            globalMax = max(globalMax, currentMax)
        }

        return maxDistance
    }
    
    //Time: O(n log n) where n is the number of elements in `arrays`
    //Space: O(n)
    //array
    //minimum
    //maximum
    //sorting
    //
    //Solution Description:
    //As we can't the minimum and maximum values from the same array we first extract the min and max elements from `arrays` and
    //populate `values`. We the sort that array in ascending order. From the sorted array we check if the first and last (min
    //and max value) are from the different arrays - if they are then we calculate the distance and return, if they are not then
    //we second min and second max and calculate their distance them against the min and max elements (as these second elements
    //are guranteed to be from different arrays to the min and max elements) - we return the greater distance.
    func maxDistance2(_ arrays: [[Int]]) -> Int {
        var values = [(Int, Int)]() //[(min/max, arrays index)]

        for (i, a) in arrays.enumerated() {
            values.append((a[0], i))
            values.append((a[(a.count - 1)], i))
        }

        values.sort { $0.0 > $1.0 }

        guard values[0].1 == values[(values.count - 1)].1 else {
            return abs(values[0].0 - values[(values.count - 1)].0)
        }

        let first = abs(values[1].0 - values[(values.count - 1)].0)
        let second = abs(values[0].0 - values[(values.count - 2)].0)

        return max(first, second)
    }
}
