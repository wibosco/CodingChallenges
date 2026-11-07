// Created 07/11/2026.

import Foundation

//https://leetcode.com/problems/minimum-operations-to-make-elements-within-k-subarrays-equal/
struct MinimumOperationsToMakeElementsWithinKSubarraysEqual {
    
    //Time: O(n * k + n * x log x) where n is the number of elements in `nums`
    //                             where k is the number of subarrays
    //                             where x is the number of elements in each subarray
    //Space: O(n * k)
    //array
    //DFS
    //recursive
    //dynamic programming
    //sorting
    //memoization
    //median
    //inout
    //
    //Solution Description:
    //We recursively choose each index as a starting point and determine if a path exists from that index to generate `k`
    //subarrays of size `x`. At each recursive frame we can either skip the current `i` or make use of it. Skipping the
    //current `i` as well as using it ensures that we generate all possible paths through `nums` by using each valid index
    //as a start of a subarray. We determine the path of the subarrays before calculating that path's operation cost. This
    //ensures that we don't waste effort calculating when the required `k` subarrays can't be generated from that path. When
    //we make use of `i` as the start for a subarray, we need to determine the fewest operations (+1 or -1) that can be made
    //to the elements in that subarray to equalise their value. The fewest/cheapest way to do this is to sort the subarray,
    //take the median element and adjust the other elements to match that value. The median is the cheapest target because
    //moving away from it brings the target closer to fewer than half of the elements and further from at least half, so
    //the operation count can only go up. Once we know how many operations are needed we add that value to the current
    //recursion call that chose `i`. We then return the minimum of the recursion that used `i` and the recursion that
    //skipped `i`. If a path isn't able to produce `k` subarrays we use `Int.max` to ensure that path can never be the
    //minimum value - we also check for `Int.max` before adding the operation count to avoid overflowing. When `remaining`
    //equals 0 we start to unwind the path and perform the operation calculations for each subarray on that path. As the
    //various paths through `nums` end up traversing the same subpaths, we can use memoization to cache the fewest
    //operations needed for that `i` and `remaining` combination. Also, to avoid needing to calculate the operations for
    //the same subarray more than once, we store the count in a dictionary - unlike the memoization cache, this cache doesn't
    //care about what the `remaining` value was. When all paths have been searched we can return the fewest operation count.
    func minOperations(_ nums: [Int], _ x: Int, _ k: Int) -> Int {
        var memo = [[Int]: Int]()
        var windows = [Int: Int]()
        return dfs(nums, 0, x, k, &memo, &windows)
    }

    private func dfs(_ nums: [Int], _ i: Int, _ size: Int, _ remaining: Int, _ memo: inout [[Int]: Int], _ windows: inout [Int: Int]) -> Int {
        guard memo[[i, remaining]] == nil else {
            return memo[[i, remaining]]!
        }

        guard remaining > 0 else {
            return 0
        }

        guard (i + size) <= nums.count else {
            return Int.max
        }

        var useCount = dfs(nums, (i + size), size, (remaining - 1), &memo, &windows)
        let skipCount = dfs(nums, (i + 1), size, remaining, &memo, &windows)

        if useCount < Int.max {
            if let operationsToEqualise = windows[i] {
                useCount += operationsToEqualise
            } else {
                let values = nums[i..<(i + size)]
                let sorted = values.sorted()
                let median = sorted[(sorted.count / 2)]

                let operationsToEqualise = values.reduce(0) { $0 + abs($1 - median) }
                windows[i] = operationsToEqualise

                useCount += operationsToEqualise
            }
        }

        memo[[i, remaining]] = min(useCount, skipCount)

        return memo[[i, remaining]]!
    }
}
