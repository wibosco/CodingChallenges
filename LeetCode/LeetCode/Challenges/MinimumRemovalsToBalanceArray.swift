// Created 14/02/2026.

import Foundation

//https://leetcode.com/problems/minimum-removals-to-balance-array/
struct MinimumRemovalsToBalanceArray {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //sliding window
    //two pointers
    //fast forward
    //
    //Solution Description:
    //To minimise the removals we first sort `nums` in non-descending order then using a sliding window determine the minimum number of
    //removals needed to "balance" `nums`. The sliding window is kept valid by either moving `l` or `r` until `nums[r]` is less than or
    //equal to `nums[l] * k`. As we want to minimise the number of removals `r` is pushed to it's maximum value before `minRemovals` is
    //(potentally) updated. Once all indexes in `nums` have been checked, we can return `minRemovals`.
    func minRemoval(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        //O(n log n)
        let nums = nums.sorted()
        var minRemovals = (nums.count - 1) //a single element array is considered "balanced" so the max removals is `nums.count - 1`

        var l = 0
        var r = 0

        //O(n)
        while l < nums.count {
            while r < nums.count, nums[r] <= (nums[l] * k) {
                r += 1
            }

            let removals = (l + ((nums.count - 1) - (r - 1)))

            minRemovals = min(minRemovals, removals)

            l += 1
        }

        return minRemovals
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //binary search
    //
    //Solution Description:
    //To minimise the removals we first sort `nums` in non-descending order then using binary seach determine the minimum number of
    //removals needed to "balance" `nums` for any given starting index. The binary search attempts to find the right-most index where
    //`nums[right]` is less than or equal to `nums[left] * k`. When all indexes are checked `minRemovals` is returned.
    func minRemoval2(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        //O(n log n)
        let nums = nums.sorted()
        var minRemovals = (nums.count - 1) //a single element array is considered "balanced" so the max removals is `nums.count - 1`

        //O(n log n)
        for i in 0..<nums.count {
            minRemovals = min(minRemovals, upperBounds(nums, i, (nums.count - 1), k))
        }

        return minRemovals
    }
    
    private func upperBounds(_ nums: [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
        guard l < r else {
            return (nums.count - 1)
        }

        let target = nums[l] * k

        var left = l
        var right = r

        while left <= right {
            let mid = left + (right - left) / 2

            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return (l + ((nums.count - 1) - (left - 1)))
    }
    
    //Time: O(2 ^ n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //graph theory
    //DFS
    //recursive
    //two pointers
    //
    //Solution Description:
    //To minimise the removals we first sort `nums` in non-descending order then using two pointers we recursively explore that sorted
    //array. At each step we determine if `nums[r]` is less than or equal to `nums[l] * k`, if it is then we know that we have found
    //the minimum removals from `l` to balance the array; if it isn't then we need to decide whether to move `l` or `r`, as we don't
    //know which one to move, we branch and move `l` in one branch and `r` in the other branch. When branching we return the smallest
    //of the two branching values. Eventually all paths are checked and we can return the minimum removals.
    func minRemoval3(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        let nums = nums.sorted()

        return dfs(nums, 0, (nums.count - 1), k)
    }

    private func dfs(_ nums: [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
        guard l < r else {
            return (nums.count - 1) //a single element array is considered "balanced" so the max removals is `nums.count - 1`
        }

        guard nums[r] > (nums[l] * k)  else {
            return l + ((nums.count - 1) - r)
        }

        return min(dfs(nums, (l + 1), r, k), dfs(nums, l, (r - 1), k))
    }
}
