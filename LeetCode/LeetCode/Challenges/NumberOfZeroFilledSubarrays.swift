//
//  NumberOfZeroFilledSubarrays.swift
//  LeetCode
//
//  Created by William Boles on 15/07/2023.
//

import Foundation

//https://leetcode.com/problems/number-of-zero-filled-subarrays/
struct NumberOfZeroFilledSubarrays {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(log n)
    //array
    //substring
    //maths
    //
    //Solution Description:
    //First we determine the length of each subarray of zeros in nums which we store in `zeroSubArrayCounts`. We then calculate
    //the count of all possible subarrays of `zeroSubArrayCounts` using `count * (count + 1) / 2`, this count is added to
    //`total`. We repeat this process for all elements of `zeroSubArrayCounts` and then return `total`.
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var zeroSubArrayCounts = [Int]()
        var zeroCount = 0
        
        for num in nums {
            if num == 0 {
                zeroCount += 1
            } else if zeroCount > 0 {
                zeroSubArrayCounts.append(zeroCount)
                zeroCount = 0
            }
        }
        
        if zeroCount > 0 {
            zeroSubArrayCounts.append(zeroCount)
        }
        
        var total = 0
        for count in zeroSubArrayCounts {
            total += count * (count + 1) / 2
        }
        
        return total
    }
    
    //Time: O(
    //Space: O(
    //array
    //substring
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //First we find all the subarrays containing only zeros in `nums` and store them in the `zeros` array. Then we generate all
    //possible subarrays from `zeros` and add the count to `total`. We repeat this process until all elements in `zeros` have
    //been counted. We then return that total.
    func zeroFilledSubarrayExpensiveMemory(_ nums: [Int]) -> Int {
        var zeros = [[Int]]()
        var zeroCount = 0
        
        for num in nums {
            if num == 0 {
                zeroCount += 1
            } else if zeroCount > 0 {
                zeros.append(Array(repeating: 0, count: zeroCount))
                zeroCount = 0
            }
        }
        
        if zeroCount > 0 {
            zeros.append(Array(repeating: 0, count: zeroCount))
        }
        
        var total = 0
        for i in zeros {
            let substrings = generateSubarrays(i)
            total += substrings.count
        }
        
        return total
    }
    
    private func generateSubarrays(_ zeros: [Int]) -> [[Int]] {
        var subarrays = [[Int]]()
        
        for i in 0..<zeros.count {
            dfs(zeros, i, [], &subarrays)
        }
        
        return subarrays
    }
    
    private func dfs(_ zeros: [Int], _ index: Int, _ subarray: [Int], _ subarrays: inout [[Int]]) {
        guard index < zeros.count else {
            return
        }
    
        let nextSubArray = subarray + [zeros[index]]
        subarrays.append(nextSubArray)
        dfs(zeros, (index + 1), nextSubArray, &subarrays)
    }
}
