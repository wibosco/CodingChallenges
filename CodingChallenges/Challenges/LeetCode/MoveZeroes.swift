//
//  MoveZeroes.swift
//  CodingChallenges
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/move-zeroes/
//array
struct MoveZeros {
    
    //Time: O(n)
    //two pointers
    static func moveZeroes(_ nums: inout [Int]) {
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
    
    //Time: O(n)
    static func moveZeroesAppending(_ nums: inout [Int]) {
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
