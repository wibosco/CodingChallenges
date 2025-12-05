// Created 05/12/2025.

import Foundation

//https://leetcode.com/problems/count-partitions-with-even-sum-difference/
struct CountPartitionsWithEvenSumDifference {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //prefix sum
    //array
    //modulo
    //
    //Solution Description:
    //We iterate through `nums` and build up a prefix sum array that can be used to determine the totals of each partition in
    //O(1) time. We then iterate through the `prefixSum` and calculate if the difference between the two partitions is even. If
    //the difference is even we increment `count`. Once all possible partitions of `prefixSum` have been check we return `count`.
    func countPartitions(_ nums: [Int]) -> Int {
        var prefixSum = [Int]()

        var sum = 0
        for num in nums {
            sum += num
            prefixSum.append(sum)
        }

        var count = 0

        for i in 1..<prefixSum.count {
            let prevSum = prefixSum[(i - 1)]

            if (prevSum - (sum - prevSum)) % 2 == 0 {
                count += 1
            }
        }

        return count
    }
}
