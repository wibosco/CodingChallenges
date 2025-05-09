// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points/
struct FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //three pointers
    //
    //Solution Description:
    //We iterate through the list comparing each node against its previous and next node. If that node is either smaller or
    //larger than the surrounding nodes it is considered a critical point node. As we want to calculcate two distances: min
    //and max distance between critical point nodes we need to track the previous critical point node as the min distance
    //will always be between two neighbor nodes and the first critical point node as the max distance will always be between
    //the first critical point node and the last critical point node. When we encounter a critical point node we check if
    //there has been a previous critical point node found and use that to calculcate the `minDist`, we also calculate the
    //`maxDist` if a previous critical point node has been found (using the `firstCriticalPoint`). We repeat this process
    //for all critical point node. Once all elements in the list have been checked we return either `[-1, -1]` if there
    //where too few critical point nodes to calculate distances or the distances themselves.
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        var firstCriticalPoint: Int?
        var previousCriticalPoint: Int?
        
        var minDist = Int.max
        var maxDist = -1
        
        var current = head
        var counter = 1
        while let l = current, let m = l.next, let r = m.next {
            if (m.val > l.val && m.val > r.val) ||
                (m.val < l.val && m.val < r.val) {
                if let previousCriticalPoint {
                    minDist = min(minDist, (counter - previousCriticalPoint))
                }
                previousCriticalPoint = counter
                
                if let firstCriticalPoint {
                    maxDist = max(maxDist, (counter - firstCriticalPoint))
                } else {
                    firstCriticalPoint = counter
                }
            }
            
            current = m
            counter += 1
        }

        return minDist == Int.max ? [-1, -1] : [minDist, maxDist]
    }
}
