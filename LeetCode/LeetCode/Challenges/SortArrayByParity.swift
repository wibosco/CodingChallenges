//
//  SortArrayByParity.swift
//  LeetCode
//
//  Created by William Boles on 07/06/2024.
//

import Foundation

//https://leetcode.com/problems/sort-array-by-parity/
struct SortArrayByParity {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //in-line
    //
    //Solution Description:
    //Using two pointers we iterate through `nums` and move values depending on if they are even or not. `p1` is the value that is
    //being sorted - if the value at `p1` is even we move `p1` and `p2` forward as `p1` is already in the correct position; if the
    //value is odd we check if the value at `p2` is even, if so we swap them and move `p1` and `p2` forward, if not we only move
    //`p2` forward in search of the next unsorted even value to swap with the odd value at `p1`. If both values are odd we move `p2`
    //forward as `p1` isn't sorted yet. This results in every value before `p1` being even, every value between `p1` and `p2` being
    //odd, every value from `p2` being unknown. Once `p2` reaches the end of `nums` we return `nums` as all even values are before
    //the odd values.
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        
        var p1 = 0
        var p2 = 1
        
        while p2 < nums.count {
            if nums[p1].isMultiple(of: 2) {
                p1 += 1
            } else if nums[p2].isMultiple(of: 2) {
                let temp = nums[p1]
                nums[p1] = nums[p2]
                nums[p2] = temp
                    
                p1 += 1
            }
            
            p2 += 1
        }

        return nums
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //
    //Solution Description:
    //Iterating through `nums` we check if any given value is odd or even - if even we add it to the `evenArray` array; if
    //odd we add it to the `oddArray` array. After iterating through all values we combine `evenArray` and `oddArray` into
    //the one array and return it.
    func sortArrayByParityTwoArrays(_ nums: [Int]) -> [Int] {
        var evenArray = [Int]()
        var oddArray = [Int]()
        
        for num in nums {
            if num.isMultiple(of: 2) {
                evenArray.append(num)
            } else {
                oddArray.append(num)
            }
        }
        
        return evenArray + oddArray
    }
}
