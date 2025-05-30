// Created 30/05/2025.

import Foundation

//https://leetcode.com/problems/interval-list-intersections/
struct IntervalListIntersections {
    
    //Time: O(n + m) where n is the number of elements in `firstList`
    //               where m is the number elements in `secondList`
    //Space: O((n + m)
    //intervals
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate over `firstList` and `secondList` and find where they overlap by taking first the maximum
    //starting value and the minimum ending value and checking that the minimum value is less than or equal to the maximum value.
    //If the the minimum value is less than or equal to the maximum value then the two intervals have overlap else they don't. We
    //then update the pointer of the list that has a smaller end value and repeat the process until all intervals have beeen
    //compared so we can return the `intersection` array.
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var p1 = 0
        var p2 = 0

        var intersection = [[Int]]()
        
        while p1 < firstList.count, p2 < secondList.count {
            let left = max(firstList[p1][0], secondList[p2][0])
            let right = min(firstList[p1][1], secondList[p2][1])
            
            if left <= right {
                intersection.append([left, right])
            }
            
            if firstList[p1][1] > secondList[p2][1] {
                p2 += 1
            } else {
                p1 += 1
            }
        }
        
        return intersection
    }
    
    //Time: O(n + m) where n is the number of elements in `firstList`
    //               where m is the number elements in `secondList`
    //Space: O((n + m)
    //intervals
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate over `firstList` and `secondList` and find where they overlap by checking if their starting
    //values falls between the start and end value of an element in the other array. If it does then their is an overlap and we
    //just need to determine the end value of that overlap. Depending on which interval ends sooner we then update it's pointer.
    //Once all intervals have been compared we return the `intersection` array.
    func intervalIntersection2(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var p1 = 0
        var p2 = 0

        var intersection = [[Int]]()

        while p1 < firstList.count, p2 < secondList.count {
            let firstStart = firstList[p1][0]
            let firstEnd = firstList[p1][1]
            let secondStart = secondList[p2][0]
            let secondEnd = secondList[p2][1]

            if firstStart >= secondStart && firstStart <= secondEnd {
                //first overlaps second
                if firstEnd >= secondEnd {
                    intersection.append([firstStart, secondEnd])

                    p2 += 1
                } else {
                    intersection.append([firstStart, firstEnd])

                    p1 += 1
                }
            } else if secondStart >= firstStart && secondStart <= firstEnd {
                //second overlaps first
                if secondEnd >= firstEnd {
                    intersection.append([secondStart, firstEnd])

                    p1 += 1
                } else {
                    intersection.append([secondStart, secondEnd])

                    p2 += 1
                }
            } else {
                //no overlap
                if firstStart > secondStart {
                    p2 += 1
                } else {
                    p1 += 1
                }
            }
        }

        return intersection
    }
}
