//
//  NumberOfZeroFilledSubarrays.swift
//  LeetCode
//
//  Created by William Boles on 15/07/2023.
//

import Foundation

//https://leetcode.com/problems/number-of-zero-filled-subarrays/
struct NumberOfZeroFilledSubarrays {
    
    //Time: O(1)
    //Space: O(1)
    //array
    //substring
    //subarray
    //maths
    //
    //Solution Description:
    //As we iterate through `nums` we count the number of zeros we find in each subarray. Every time a subarray expands by one
    //element we get that increased subarray count of new subarrays so each time we encounter a zero we add that current
    //subarray count onto the total count. When we encounter a non-zero we reset the local count. Once all elements of `nums`
    //have been processed we return `totalCount`.
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var currentCount = 0
        var totalCount = 0
        
        for n in nums {
            if n == 0 {
                currentCount += 1
                totalCount += currentCount
            } else {
                currentCount = 0
            }
        }

        return totalCount
    }
    
    //Time: O(1)
    //Space: O(1)
    //array
    //substring
    //subarray
    //maths
    //
    //Solution Description:
    //As we iterate through `nums` we count the number of zeros we find in each subarray. When we come the end of the subarray
    //we can use the formula `count * (count + 1) / 2` to determine how many subarrays are possible from that zero subarray.
    //We repeat this process for elements of `nums`, special care must be taken to ensure that even when `nums` ends in a zero
    //subarray we count that as well. Once all zero subarrays have been counted we return `totalCount`.
    func zeroFilledSubarray2(_ nums: [Int]) -> Int {
        var currentCount = 0
        var totalCount = 0
        
        for n in nums {
            if n == 0 {
                currentCount += 1
            } else {
                if currentCount > 0 {
                    totalCount += (currentCount * (currentCount + 1) / 2)
                }

                currentCount = 0
            }
        }

        if currentCount > 0 {
            totalCount += (currentCount * (currentCount + 1) / 2)
        }

        return totalCount
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //substring
    //subarray
    //maths
    //
    //Solution Description:
    //First we determine the length of each subarray of zeros in nums which we store in `zeroSubArrayCounts`. We then calculate
    //the count of all possible subarrays of `zeroSubArrayCounts` using `count * (count + 1) / 2`, this count is added to
    //`total`. We repeat this process for all elements of `zeroSubArrayCounts` and then return `total`.
    func zeroFilledSubarray3(_ nums: [Int]) -> Int {
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
    
    //Time: O(n ^ 3) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //substring
    //subarray
    //two pointers
    //nested loops
    //
    //Solution Description:
    //Using two pointer we find a subarray of zeros. Then we simulate creating each possible subarray using nested loops and
    //increment `totalCount` with each iteration of the innermost loop. Once all elements in `nums` have been processed we
    //return `totalCount`.
    func zeroFilledSubarray4(_ nums: [Int]) -> Int {
        var totalCount = 0
        
        var p1 = 0
        while p1 < nums.count {
            if nums[p1] == 0 {
                var p2 = p1

                while p2 < nums.count, nums[p2] == 0 {
                    p2 += 1
                }

                let zerosCount = (p2 - p1) //no need to add 1 as `p2` is already beyond the zeros
                
                //simulate building each subarray
                for i in 0..<zerosCount {
                    for _ in i..<zerosCount {
                        totalCount += 1
                    }
                }

                p1 = p2 //p2 is now at a non-zero element or the out of bounds
            } else {
                p1 += 1
            }
        }

        return totalCount
    }
    
    //Time: O(n ^ 3) where n is the number of elements in `nums`
    //Space: O(n) recursive stack
    //array
    //substring
    //subarray
    //DFS
    //recursive
    //inout
    //two pointers
    //
    //Solution Description:
    //Using two pointer we find a subarray of zeros. Then we simulate creating each possible subarray using DFS and count
    //how many subarrays we end up. We add this local count to `totalCount` and attempt to find the next zero subarray to
    //repeat the process. Once all elements in `nums` have been processed we return `totalCount`.
    func zeroFilledSubarray5(_ nums: [Int]) -> Int {
        var totalCount = 0
        
        var p1 = 0
        while p1 < nums.count {
            if nums[p1] == 0 {
                var p2 = p1

                while p2 < nums.count, nums[p2] == 0{
                    p2 += 1
                }

                let zerosCount = (p2 - p1) //no need to add 1 as `p2` is already beyond the zeros

                for i in 0..<zerosCount {
                    countOfSubarrays(i, zerosCount, &totalCount)
                }

                p1 = p2 //p2 is now at a non-zero element or the out of bounds
            } else {
                p1 += 1
            }
        }

        return totalCount
    }

    private func countOfSubarrays(_ lower: Int, _ upper: Int, _ count: inout Int) {
        guard lower < upper else {
            return
        }

        count += 1
        countOfSubarrays((lower + 1), upper, &count)
    }
}
