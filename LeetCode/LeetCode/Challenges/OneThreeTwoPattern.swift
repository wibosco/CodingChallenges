// Created 28/07/2023.

import Foundation

//https://leetcode.com/problems/132-pattern/
struct OneThreeTwoPattern {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //stack
    //monotonic stack
    //
    //Solution Description:
    //In the 132 pattern element[1] < element[3] < element[2] so we need to find a subsequence such as `-1, 5, 3`. We increase the chances
    //of finding this pattern is element[1] is the smallest it can be and element[2] is the largest it can be. Using a decreasing
    //monotonic stack that stores both the element[1] and element[3] elements (first and second) we ensure that we don't fall into the trap
    //of taking a greedy approach that would prevent us from finding element[2]. When iterating through `nums`, we first attempt to maximise
    //element[3], by removing any smaller elements from the stack, we then check if the `num` is greater than element[1] and if it is we
    //return true as we have found all 3 elements of the 132 pattern, else we add `(minVal, num)` as a possible candidate to the stack and
    //check if `num` is smaller than `minVal` so future `nums` elements. If after iterating through all of `nums` we haven't returned true,
    //we return false.
    func find132pattern(_ nums: [Int]) -> Bool {
        var stack = [(Int, Int)]() //(minimumValueBeforeNum, num)
        var minVal = Int.max
        
        for num in nums {
            //searching for the second element in the 132 pattern
            while let last = stack.last, num >= last.1 {
                stack.removeLast()
            }
            
            //in order for anything to still be on the stack, num must be smaller than the second element in the 132 pattern
            //so we now need to check if num is greater than the first element in the 132 pattern
            if let last = stack.last, num > last.0 {
                return true
            }
            
            //potentially the first (`minVal`) and second (`num`) elements in the 132 pattern
            stack.append((minVal, num))
            
            //if a new min has been found, update it here
            minVal = min(minVal, num)
        }
        
        return false
    }
}
