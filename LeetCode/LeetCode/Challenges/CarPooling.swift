// Created 25/05/2025.

import Foundation

//https://leetcode.com/problems/car-pooling/
struct CarPooling {
    
    //Time: O(n log n) where n is the number of elements in `trips`
    //Space: O(n)
    //array
    //sorted
    //two pointers
    //fast forward
    //intervals
    //
    //Solution Description:
    //It is possible for trip to start and end within another trip so merely sorting `trips` by end location isn't enough
    //as a trip is is both earlier starting and later finishing would happen out of squence. Instead we need to pull apart
    //`trips` into two sorted arrays - one for start locations and one for end locations and then iterate through these
    //two arrays using two pointers, adding and substracting passengers from `remainingCapacity`. By sorting `start` and
    //`end` we ensure that we are adding and removing passengers in the correct order. We iterate through `start` and
    //attempt to passengers at that location to the car. Where a start location is greater than or equal to the current
    //end location we fast forward through the end locations removing passengers and so increasing `remainingCapacity`
    //until we either end up with the end location being greater than the current start location or we run out of end
    //locations. We then add the current start locations passengers to car by reducing `remainingCapacity`. If
    //`remainingCapacity` is ever less than 0 we return false. We repeat this process for all `start` elements. If the
    //loop ends we know that passengers can be picked up and can return true.
    //
    //Similar to: https://leetcode.com/problems/meeting-rooms-ii/
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var start = [[Int]]() //[passengers, start]
        var end = [[Int]]() //[passengers, end]

        var remainingCapacity = capacity

        for trip in trips {
            start.append([trip[0], trip[1]])
            end.append([trip[0], trip[2]])
        }

        start.sort { $0[1] < $1[1] }
        end.sort { $0[1] < $1[1] }

        var startPointer = 0
        var endPointer = 0

        while startPointer < start.count {
            while endPointer < end.count, start[startPointer][1] >= end[endPointer][1] {
                remainingCapacity += end[endPointer][0]
                endPointer += 1
            }

            remainingCapacity -= start[startPointer][0]

            if remainingCapacity < 0 {
                return false
            }

            startPointer += 1
        }

        return true
    }
}
