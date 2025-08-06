// Created 06/08/2025.

import Foundation

//https://leetcode.com/problems/range-sum-query-immutable/
//design
//prefix sum
//
//Solution Description:
//Rather than traversing `nums` each time `sumRange(_:, _:)` is called, we can use a prefix sum to calculate the acumulative
//sum of each index. These sums can be subtracted from each other to calculate the sum range value.
struct RangeSumQueryImmutable {
    private let prefixSums: [Int]

    //O(n)
    init(_ nums: [Int]) {
        var prefixSum = 0
        var prefixSums = [0] // NB. leading zero which is needed for range prefix sum problems
        for num in nums {
            prefixSum += num
            prefixSums.append(prefixSum)
        }
        self.prefixSums = prefixSums
    }
    
    //O(1)
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return prefixSums[right + 1] - prefixSums[left]
    }
}
