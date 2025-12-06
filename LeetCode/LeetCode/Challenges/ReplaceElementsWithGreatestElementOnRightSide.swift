// Created 06/07/2023.

import Foundation

//https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/
struct ReplaceElementsWithGreatestElementOnRightSide {
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(n)
    //array
    //
    //Solution Description:
    //Going right-to-left we iterate through `arr` and hold onto the highest/biggest value that we have seen so far - `rightMax`.
    //This value is used to set the element at the same index as we are iterating at in `result`, we then compare the current
    //value against `rightMax` and take the larger of the two as the next `rightMax`. We repeat this process until all elements
    //have been seen.
    func replaceElements(_ arr: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: arr.count)
        var rightMax = -1
        
        for (i, val) in arr.enumerated().reversed() {
            result[i] = rightMax
            rightMax = max(rightMax, val)
        }
        
        return result
    }
}
