// Created 16/12/2021.

import Foundation

//https://leetcode.com/problems/reverse-string/
struct ReverseString {
    
    //Time: O(n) where n is the count of the elements in `s`
    //Space: O(1)
    //two pointers
    //iterative
    //
    //Solution Description:
    //Using two pointers - `left` at the start of `s` and `right` at the end of `s`, swap the elements at those two
    //locations. Then increment/decrement the respective pointers until they go beyond each other at which point we
    //have swapped all elements in `s`
    func reverseStringIterative(_ s: inout [String]) {
        guard s.count > 1 else {
            return
        }
        
        var left = 0
        var right = s.count - 1
        
        while left < right {
            s.swapAt(left, right)
            
            left += 1
            right -= 1
        }
    }
    
    //Time: O(n) where n is the count of the elements in `s`
    //Space: O(n) if counting the recursive stack otherwise O(1)
    //two pointers
    //recursive
    //inout
    //
    //Solution Description:
    //Using two pointers - `left` at the start of `s` and `right` at the end of `s`, swap the elements at those two
    //locations. Then increment/decrement the respective pointers until they go beyond each other at which point we
    //have swapped all elements in `s`
    func reverseString(_ s: inout [String]) {
        reverseString(&s, 0, (s.count - 1))
    }
    
    private func reverseString(_ s: inout [String], _ left: Int, _ right: Int) {
        guard left < right else {
            return
        }
        
        s.swapAt(left, right)
        reverseString(&s, (left + 1), (right - 1))
    }
}
