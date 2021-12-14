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
    
    //Time: O(n + m) where n is the numbers of elements in `nums1` and m is the number of elements in `nums2`
    //Space: O(n) where n is the the number of elements in `nums1`
    //monotonic decreasing stack
    //
    //Solution Description:
    //Using a monotonic decreasing stack we iterate through `nums2` finding the next greater value
    //for element in that array - as `nums1` is a subset of `nums2` we know that the greater value
    //of any `nums2` element is also the greater value of any `nums1` element. As we find greater
    //values in `nums1` we pop the stack and add them to `nums2Dict` with the lesser value being
    //the key and greater value being the value. Once we are finished populating `nums2Dict` we
    //iterate through `nums1` and populate `result` with the values from `nums2Dict` in the order
    //of `nums1`
    static func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        
        var nums2Dict = [Int: Int]()
        for num in nums2 {
            while !stack.isEmpty {
                guard stack.last! < num else {
                    break
                }
                
                let lesser = stack.removeLast()
                nums2Dict[lesser] = num
            }
            
            stack.append(num)
        }
        
        var result = Array(repeating: -1, count: nums1.count)
        for (i, num) in nums1.enumerated() {
            guard let greater = nums2Dict[num] else {
                continue
            }
            
            result[i] = greater
        }
        
        return result
    }
}
