//
//  MoveZeroes.swift
//  LeetCode
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/move-zeroes/
struct MoveZeros {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //sorting
    //pivot
    //
    //Solution Description:
    //Using a fast and slow pointer move through the array. The slow pointer is used to identify zero value; the fast pointer
    //used to identify non-zero values. With the slow pointer on a zero value and the fast pointer on a non-zero value, the
    //values are swapped - the ordering of the zeros isn't important so swapping the first zero is fine. This will result in
    //the zeros moving gradually moved to the end of the array as we partition the array.
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var slow = 0
        var fast = 1
        
        while fast < nums.count {
            if nums[slow] == 0 && nums[fast] != 0 {
                nums.swapAt(slow, fast)
                
                slow += 1
            } else if nums[slow] != 0 {
                slow += 1
            }
            
            fast += 1
        }
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //removal
    //
    //Solution Description:
    //Remove zeros from `nums` as this are found while keeping a count of how many have been removed. Once all zeros have been
    //removed, add them to the end of the array.
    func moveZeroesAppending(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var zerosFound = 0
        var i = 0
        
        while i < nums.count {
            if nums[i] == 0 {
                nums.remove(at: i)
                zerosFound += 1
            } else {
                i += 1
            }
        }
        
        if zerosFound != 0 {
            let zeros = Array(repeating: 0, count: zerosFound)
            nums.append(contentsOf: zeros)
        }
    }
}
