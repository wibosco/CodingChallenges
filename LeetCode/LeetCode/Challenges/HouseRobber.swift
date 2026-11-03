// Created 13/04/2023.

import Foundation

//https://leetcode.com/problems/house-robber/
struct HouseRobber {
    
    //Time: O(n) where n is the number of element in `nums`
    //Space: O(n)
    //array
    //graph theory
    //DFS
    //recursive
    //memoization
    //inout
    //top-down
    //
    //Solution Description:
    //Treating `nums` as a graph we can traverse the graph using DFS and determine the maximum path. The only constraint on
    //movement within the graph is that we can not move from one node to it's immediate `nums` array neighbor so a graph
    //neighbor needs to be at least 2 array neighbors away. It's important to point out that it can more than 2 neighbors
    //away. At each recursive frame we decide if we skip the house or rob, if we skip skip it `total` is unchanged and we
    //move onto the next index (`i + 1`), if we rob the house then we then `total` is increased by the value of the house
    //and we move onto the next next index (`i + 2`). By using `i` like this to skip invalid indexes we don't need to we
    //ensure that everytime `dfs` lands the element it lands can be both skipped or robbed without needing to pass a
    //`skip` value into `dfs`. Rather than pass a `total` or `sum` value down, we instead allow the path value to "bubble"
    //up with the unwinding of each recursive frame. Before we eahc unwind (other than the final frame) we compare the
    //total of the skipped and robbed paths and take the higher value. We make use of memoization to avoid having to
    //recalculate total for paths already taken (that is the path from `i...end`, not the path from `start...i...end`).
    //Once all paths have been searched and unwound we return that highest total path value.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    //
    ////Similar to: https://leetcode.com/problems/house-robber-ii/
    func rob(_ nums: [Int]) -> Int {
        var memo = [Int: Int]()

        return dfs(nums, 0, &memo)
    }

    private func dfs(_ nums: [Int], _ i: Int, _ memo: inout [Int: Int]) -> Int {
        guard i < nums.count else {
            return 0
        }

        guard memo[i] == nil else {
            return memo[i]!
        }
        
        let skip = dfs(nums, (i + 1), &memo)
        let rob = dfs(nums, (i + 2), &memo) + nums[i] //notice `i + 2` to skip the next house

        let res = max(skip, rob)

        memo[i] = res
        return res
    }
    
    
    //Time: O(2 ^ n) where n is the number of element in `nums`
    //Space: O(n)
    //array
    //graph thoery
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `nums` as a graph we can traverse the graph using DFS and determine the maximum path. The only constraint on
    //movement within the graph is that we can not move from one node to it's immediate `nums` array neighbor so a graph
    //neighbor needs to be at least 2 array neighbors away. It's important to point out that it can more than 2 neighbors
    //away. At each recursive frame we decide if we skip the house or rob, if we skip skip it `total` is unchanged and we
    //move onto the next index (`i + 1`), if we rob the house then we then `total` is increased by the value of the house
    //and we move onto the next next index (`i + 2`). By using `i` like this to skip invalid indexes we don't need to we
    //ensure that everytime `dfs` lands the element it lands can be both skipped or robbed without needing to pass a
    //`skip` value into `dfs`. When there are no more elements on the current path, we return `total`. This allows the
    //other paths to be search. When a path returns we take the greater of `skip` and `rob`. Once all paths have been
    //searched and unwound we return the highest `total`.
    func rob2(_ nums: [Int]) -> Int {
        return dfs(nums, 0, 0)
    }

    private func dfs(_ nums: [Int], _ i: Int, _ total: Int) -> Int {
        guard i < nums.count else {
            return total
        }
        
        let skip = dfs(nums, (i + 1), total)
        let rob = dfs(nums, (i + 2), (total + nums[i])) //notice `i + 2` to skip the next house

        return max(skip, rob)
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //graph theory
    //memoization
    //top-down
    //dynamic programming
    //DFS
    //recursive
    //dynamic vertices
    //
    //Solution Description:
    //Treating `nums` as a graph we can traverse the graph using DFS and determine the maximum path. The only constraint on
    //movement within the graph is that we can not move from one node to it's immediate `nums` array neighbor so a graph
    //neighbor needs to be at least 2 array neighbors away. It's important to point out that it can more than 2 neighbors
    //away. So using the DFS we start at either of our starting positions index 0 or index 1 and form every possible
    //premutation of `nums`, taking the maximum value at each node. To speed up the process we use memoization to store the
    //maximum value from a given node to the end of `nums` - this way we can avoid performing repeated work.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func rob3(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.max()!
        }
        
        var memo = [Int: Int]()
        
        return max(dfs3(nums, 0, &memo), dfs3(nums, 1, &memo))
    }
    
    private func dfs3(_ nums: [Int], _ start: Int, _ memo: inout [Int: Int]) -> Int {
        guard start < nums.count else {
            return 0
        }
        
        guard memo[start] == nil else {
            return memo[start]!
        }
        
        let nextStart = (start + 2)
        guard nextStart < nums.count else {
            return nums[start]
        }
        
        var maxValue = nums[start]
        
        for i in nextStart..<nums.count {
            let value = dfs3(nums, i, &memo) + nums[start]
            
            maxValue = max(maxValue, value)
        }
        
        memo[start] = maxValue
        
        return maxValue
    }
}
