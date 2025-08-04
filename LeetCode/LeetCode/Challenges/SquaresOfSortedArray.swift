//
//  SquaresOfSortedArray.swift
//  LeetCode
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/squares-of-a-sorted-array/
struct SquaresOfSortedArray {
    
    //Time: O(n) where is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //
    //Solution Description:
    //Whenever we square a number we always get a positive and if `a^2` > `b^2` then `a` > `b`. With these observations we can
    //treat `nums` as a semi sorted array of numbers (every positive number is already sorted). Using two pointers we iterate
    //through `nums` from opposite ends comparing the squared values at each pointer - this way if `nums` contains negative
    //numbers the largest negative will be compared to the largest positive to determine which one produces the largest squqre
    //value. Which value is larger has it's pointer either increment or decremented to move onto the next element. As we are
    //going largest to smallest when comparing values, when we add values to `squared` we do so from index `(n - 1)...0`. Once
    //all elements have been compared we return `squared`.
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var squared = Array(repeating: 0, count: nums.count) //avoid having to expand the array with each new append
        
        var left = 0
        var right = nums.count - 1
        
        for i in (0..<squared.count).reversed() {
            let leftValue = abs(nums[left])
            let rightValue = abs(nums[right])
            
            let square: Int
            if leftValue > rightValue {
                square = leftValue * leftValue
                
                left += 1
            } else {
                square = rightValue * rightValue
                
                right -= 1
            }
            
            squared[i] = square
        }
        
        return squared
    }
    
    //Time: O(n) where n is the number of elements in `num`
    //Space: O(n)
    //array
    //two pointers
    //
    //Solution Description:
    //As a negative number when squared bcomes a positive number and `nums` can contain both positive and negative numbers
    //when building the `squared` array we can't just go `0..<n`. Instead we need to find where in `nums` the elements go
    //from negative to positive (the pivot) and then iterate through `nums` as if it was two arrays. To find this pivot we
    //iterate through `nums` and increment `pivot` if the value is negative. With the pivot found we can then use two
    //pointers to iterate through each side of `nums`. Each iteration we either increment/decrement one of the pointers
    //depending on which squared value is greater. That squared value is added to `squares`, once all elements on `nums`
    //have been processed we return `squares`.
    func sortedSquares2(_ nums: [Int]) -> [Int] {
        var pivot = 0
        for num in nums {
            guard num < 0 else {
                break
            }

            pivot += 1
        }

        var squares = [Int]()

        var p1 = pivot - 1
        var p2 = pivot

        for _ in 0..<nums.count {
            if p1 >= 0 {
                if p2 > (nums.count - 1) || abs(nums[p1]) < nums[p2] {
                    squares.append((nums[p1] * nums[p1]))

                    p1 -= 1

                    continue
                }
            }

            squares.append((nums[p2] * nums[p2]))

            p2 += 1
        }

        return squares
    }
    
    //Time: O(n log n) where is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //
    //Solution Description:
    //Square all the nums and add them to the `squared` array in the order of `nums`. Then sort the squared array in ascending
    //order
    func sortedSquares3(_ nums: [Int]) -> [Int] {
        var squared = [Int]()
        for num in nums {
            squared.append((num * num))
        }
        
        let sorted = squared.sorted { $0 < $1 }
        
        return sorted
    }
}
