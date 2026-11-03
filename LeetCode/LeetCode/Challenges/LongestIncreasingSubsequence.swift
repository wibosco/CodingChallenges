// Created 02/04/2023.

import Foundation

//https://leetcode.com/problems/longest-increasing-subsequence
struct LongestIncreasingSubsequence {
    
    //Time: O(n ^ 2) where n is the number of elements in `nums` (nested for loops)
    //Space: O(n)
    //array
    //graph theory
    //dynamic programming
    //bottom-up
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph and determine the longest possible incrementing subsequence by visiting
    //each node of that graph from every possible path backwards. By going backwards we ensure that the value at a given index in
    //`lis` is the largest subsequence count (from that index). So first we loop backwards to ensure that quickest route to that
    //count and then once we get to an index we take advantage of previously calculations to to loop forward through all possible
    //indexes that can be visited and extract the longest value - we add to this as the current node need is added to the
    //count.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var lis = Array(repeating: 1, count: nums.count)
        
        for i in (0..<nums.count).reversed() {
            for j in i..<nums.count {
                if nums[i] < nums[j] { //as we are iterating backwards i needs to be smaller than j
                    lis[i] = max(lis[i], (lis[j] + 1))
                }
            }
        }
        
        return lis.max() ?? 0
    }
    
    //Time: O(n ^ 2) where n is the number of elements in `nums` (each node's `for` loop only runs once thanks to `memo`)
    //Space: O(n)
    //array
    //graph theory
    //DFS
    //recursive
    //memoization
    //top-down
    //dynamic programming
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph in a DFS manner to determine the longest possible ascending
    //subsequence. To avoid traversing paths that we have already travelled down we use memoization to store the longest
    //ascending subsequence that can follow each node - as an entry is only added once every path from that node has been
    //checked, you know that if a node has a memoization entry, that entry is the maximum. At each node in the graph we check
    //all nodes that come after it for its next valid subsequence element - this is because choosing the first valid element
    //can "block" the longest subsequence e.g. in `[1, 100, 2, 3]` choosing `100` after `1` blocks `2, 3`, so we need to check
    //all valid nodes as the next node in the subsequence. For each valid next node we add 1 (for that node) to the length of
    //the subsequence that can follow it, and store the longest of these in `longest`. Once all possible next nodes from `i`
    //have been checked we add `longest` to `memo` and return it.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        var memo = [Int: Int]()

        return dfs(nums, 0, Int.min, &memo) //Int.min is outside the range of possible values so safe as a default tail
    }

    private func dfs(_ nums: [Int], _ i: Int, _ tail: Int, _ memo: inout [Int: Int]) -> Int {
        guard i < nums.count else {
            return 0
        }

        guard memo[i] == nil else {
            return memo[i]!
        }

        var longest = 0

        for j in i..<nums.count { //loop of any possible next element not just the first one
            guard nums[j] > tail else { //skip over non-ascending elements
                continue
            }

            let length = dfs(nums, (j + 1), nums[j], &memo) + 1 //note that `j` is used, `+ 1` needed for `j`` to be counted
            longest = max(longest, length)
        }

        memo[i] = longest

        return longest
    }
    
    //Time: O(n ^ 2) where n is the number of elements in `nums` (nested for loops)
    //Space: O(n)
    //array
    //graph theory
    //DFS
    //recursive
    //memoization
    //top-down
    //dynamic programming
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph and determine the longest possible ascending subsequence by visiting
    //each node of that graph from every possible path in DFS manner. To avoid traversing paths that we have already travelled
    //down we use memoization to store the maximum ascending subsequence from that node - due to traversing using DFS you
    //know that if a node has a memoization entry, that entry is the maximum. At each node in the graph we check all nodes that
    //come after it for it's next valid subsequence element - this is because it's possible to have to "block" the longest
    //subsequence from the current element by choosing a value that is too large, so we need to check all valid nodes at the
    //next node in the subsequence. We then store the longest subsequence in `longestFromI`. Once all possible next nodes from
    //`i` have been checked we add `longestFromI` to `memo` and return it. We then repeat this process for an earlier node.
    //Once all possible valid subsequences have been processed we can return `lis`.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func lengthOfLIS3(_ nums: [Int]) -> Int {
        var lis = 0
        var memo = [Int: Int]()
        
        for i in 0..<nums.count {
            let lengthFromI = dfs3(nums, (i + 1), nums[i], &memo) + 1 //add 1 for current node being added to count
            lis = max(lis, lengthFromI)
        }
        
        return lis
    }
    
    private func dfs3(_ nums: [Int], _ i: Int, _ num: Int, _ memo: inout [Int: Int]) -> Int {
        guard i < nums.count else {
            return 0
        }
        
        //check if we have already went down the `currentIndex` branch and can just return the result of the previous effort
        guard memo[i] == nil else {
            return memo[i]!
        }
        
        var longestFromI = 0
        for j in i..<nums.count { //need to loop over any possible next element not just the first one
            guard nums[i] > num else { //only interested in searching down an ascending subsequence
                continue
            }
        
            let lengthFromJ = dfs3(nums, (j + 1), nums[j], &memo) + 1
            longestFromI = max(longestFromI, lengthFromJ)
        }
        
        memo[i] = longestFromI
            
        return longestFromI
    }
    
    //Time: O(2 ^ n) where n is the number of elements in `nums` (at each index we can choose to add that value to our count or not)
    //Space: O(n)
    //array
    //graph theory
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph and determine the longest possible incrementing subsequence by visiting
    //each node of that graph from every possible path in DFS manner.
    func lengthOfLIS4(_ nums: [Int]) -> Int {
        var longest = 0
        
        for i in 0..<nums.count {
            dfs(nums, i, nums[i], 1, &longest)
        }
        
        return longest
    }
    
    private func dfs(_ nums: [Int], _ currentIndex: Int, _ num: Int, _ currentLength: Int, _ longest: inout Int) {
        guard currentIndex < nums.count else {
            longest = max(longest, currentLength)
            return
        }
        
        for i in currentIndex..<nums.count {
            guard nums[i] > num else { //only interested in searching down an incrementing subsequence
                longest = max(longest, currentLength)
                continue
            }
            
            dfs(nums, i, nums[i], (currentLength + 1), &longest) 
        }
    }
}
