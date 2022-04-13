//
//  NextGreaterElementI.swift
//  CodingChallengesTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/next-greater-element-i/
//stack
struct NextGreaterElementI {
    
    //Time: O(n + m) where n is the numbers of elements in `nums1`, m is the number of elements in `nums2`
    //Space: O(n) where n is the the number of elements in `nums1`
    //monotonic decreasing stack
    //dictionary
    //
    //Solution Description:
    //Using a monotonic decreasing stack we iterate through `nums2` finding the next greater value for each element in that
    //array. We do this by placing each element we come across in the stack - `stack`. We then check if the current element
    //is greater than the last stack item - if it is greater then we have just found the "next greater element" to that last
    //stack element which we can then add to the `greaterThan` dictionary with the lesser element being the key and the
    //greater element the value - this used stack element is popped from the stack so it can't be resused; if the last stack
    //element is greater than the current element then we just add that current element to the stack and continue iterating.
    //By doing this we won't have to iterate through `nums2` when looking for greater elements in the `nums1` loop instead
    //we will just "jump" straight to that "next greater element" (if it exists) in the `greaterThan` dictionary. It's
    //important to note that as `nums1` is a subset of `nums2` we know that the first greater value of a `nums2` element is
    //also the first greater value of that same element in `nums1`. Once we are finished populating `greaterThan` we iterate
    //through `nums1` and populate `result` with the values from `greaterThan` in the order of `nums1`
    static func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        
        var greaterThan = [Int: Int]()
        for num in nums2 {
            while !stack.isEmpty {
                guard stack.last! < num else {
                    break
                }
                
                let lesser = stack.removeLast()
                greaterThan[lesser] = num
            }
            
            stack.append(num)
        }
        
        var result = Array(repeating: -1, count: nums1.count)
        for (i, num) in nums1.enumerated() {
            guard let greater = greaterThan[num] else {
                continue
            }
            
            result[i] = greater
        }
        
        return result
    }
    
    //Time: O(n * m) where n is the numbers of elements in `nums1`, m is the number of elements in `nums2`
    //Space: O(n + m)
    //dictionary
    //
    //Solution Description:
    //First we build up a dictionary of all the values in `nums2` and their location. We then iterate through `nums1` using
    //the `indexing` dictionary to jump straight to the index in `nums2` for the current `nums1` element. From that element
    //we then search for any elements greater than `num1`. If we find an element it becomes an entry in `result` else we add
    //-1
    static func nextGreaterElementLooping(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var indexing = [Int: Int]()
        
        for (i, num) in nums2.enumerated() {
            indexing[num] = i
        }
        
        var result = Array(repeating: -1, count: nums1.count)
        
        for num1 in nums1 {
            let i = indexing[num1]!
            
            for num2 in nums2[i...] {
                if num2 > num1 {
                    result.append(num2)
                    break
                }
            }
        }
        
        return result
    }
}
