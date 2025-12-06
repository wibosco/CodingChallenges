// Created 26/08/2023.

import Foundation

//https://leetcode.com/problems/maximum-length-of-pair-chain/
struct MaximumLengthOfPairChain {
    
    //Time: O(n log n) where n is the number of elements in `pairs`
    //Space: O(n)
    //sorting
    //array
    //greedy
    //subsequence
    //
    //Solution Description:
    //By sorting by the second element in `pairs` we ensure that the next element is the smallest possible remaining element in
    //`pairs` so allowing us to perform a greedy, linear iteration through pairs and find the longest possible chain. By sorting
    //`pairs` we know that the longest chain must include the first elements so don't need to include multiple sources.
    //
    //N.B. We don't stop the iteration after a failure of `p2[0] > last[1]` as the longest chain can be a non-contiguous slice.
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { $0[1] < $1[1]  } //N.B. we sort on the second element

        var last = pairs[0]
        var count = 1

        for pair in pairs[1...] {
            if pair[0] > last[1] {
                count += 1
                last = pair
            }
        }

        return count
    }
    
    //Time: O(n^2) where n is the number of elements in `pairs`
    //Space: O(n)
    //array
    //sorting
    //memoization
    //top-down
    //dynamic programming
    //recursive
    //subsequence
    //DFS
    //graph theory
    //multi-source
    //
    //Solution Description:
    //Treating `pairs` as a graph we can perform a DFS to generate all possible chains. First we sort `pairs` this will as to more
    //know which elements/nodes in the graph have already been check for incursion in the current chain by ensuring that our
    //traversal of `pairs` is forward only. Next we iterate through all possible next elements/nodes and check if
    //`pair[0] > lastPair[1]` is true. If `pair[0] > lastPair[1]` is true we include `pair` in our chain and attempt to search
    //deeper from that element/node; else we skip over it to the next element/node. We repeat this process until all possible
    //valid subsequences of `pairs` has been created and take the maximum size of the created chains as the longest chain which
    //is then returned. As our DFS can result the same we use memoization to cache the maximum chain size we find for each
    //element/node work and so allow us to save on work if a later DFS recursion attempts to find maximum chain size from that
    //same element/node.
    func findLongestChainMemo(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { $0[0] < $1[0]  }
        
        var memo = [Int: Int]()
        var maxCount = 0
        
        for i in 0..<pairs.count {
            let count = dfs(pairs, i, &memo)
            
            maxCount = max(maxCount, count)
        }
        
        return maxCount + 1

    }
    
    private func dfs(_ pairs: [[Int]], _ lastIndex: Int, _ memo: inout [Int: Int]) -> Int {
        guard lastIndex < pairs.count else {
            return 0
        }
        
        guard memo[lastIndex] == nil else {
            return memo[lastIndex]!
        }
 
        let lastPair = pairs[lastIndex]
        var maxCount = 0
        
        for i in (lastIndex + 1)..<pairs.count {
            let pair = pairs[i]
            
            if pair[0] > lastPair[1] {
                let count = dfs(pairs, i, &memo) + 1
                maxCount = max(maxCount, count)
            }
        }
        
        memo[lastIndex] = maxCount
        
        return maxCount
    }
    
    //Time: O(n^3) where n is the number of elements in `pairs`
    //Space: O(n)
    //array
    //sorting
    //recursive
    //subsequence
    //DFS
    //graph theory
    //multi-source
    //
    //Solution Description:
    //Treating `pairs` as a graph we can perform a DFS to generate all possible chains. First we sort `pairs` this will as to more
    //know which elements/nodes in the graph have already been check for incursion in the current chain by ensuring that our
    //traversal of `pairs` is forward only. Next we iterate through all possible next elements/nodes and check if
    //`pair[0] > lastPair[1]` is true. If `pair[0] > lastPair[1]` is true we include `pair` in our chain and attempt to search
    //deeper from that element/node; else we skip over it to the next element/node. We repeat this process until all possible
    //valid subsequences of `pairs` has been created and take the maximum size of the created chains as the longest chain which
    //is then returned.
    func findLongestChainDFS(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { $0[0] < $1[0]  }
            
        var maxCount = 0
        
        for i in 0..<pairs.count {
            let count = dfs(pairs, i)
            
            maxCount = max(maxCount, count)
        }
        
        return maxCount + 1

    }
    
    private func dfs(_ pairs: [[Int]], _ lastIndex: Int) -> Int {
        guard lastIndex < pairs.count else {
            return 0
        }
        
        let lastPair = pairs[lastIndex]
        var maxCount = 0
        
        for i in (lastIndex + 1)..<pairs.count {
            let pair = pairs[i]
            
            if pair[0] > lastPair[1] {
                let count = dfs(pairs, i) + 1
                maxCount = max(maxCount, count)
            }
        }
        
        return maxCount
    }
}
