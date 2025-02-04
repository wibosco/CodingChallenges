//
//  ValidateStackSequences.swift
//  LeetCode
//
//  Created by William Boles on 28/07/2023.
//

import Foundation

//https://leetcode.com/problems/validate-stack-sequences/
struct ValidateStackSequences {
    
    //Time: O(n) where n is the number of elements in `pushed` and `popped`
    //Space: O(n)
    //stack
    //greedy
    //array
    //
    //Solution Description:
    //Iterating through `pushed` we populate a stack with the elements that we encounter. We then check if that recently added element
    //matches the current `poppedIndex`, if it does we pop it from the stack and check if the new stack head can also be popped, we
    //repeat this process until either the stack is empty, `poppedIndex` goes beyond the count of `popped` or the head of the stack
    //doesn't match the `poppedIndex` element - this is a greedy approach. We then process the next element in `pushed`. If all pushed
    //elements can be popped to match the order of `popped` then `poppedIndex` should have the same value as either `pushed` or `popped`.
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        
        var poppedIndex = 0
        
        for element in pushed {
            stack.append(element)
            
            while !stack.isEmpty && poppedIndex < popped.count {
                guard stack.last == popped[poppedIndex] else {
                    break
                }
                
                stack.removeLast()
                poppedIndex += 1
            }
        }
    
        return poppedIndex == pushed.count
    }
}
