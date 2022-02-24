//
//  CombinationSumIII.swift
//  LeetCode
//
//  Created by William Boles on 24/02/2022.
//

import Foundation

//https://leetcode.com/problems/combination-sum-iii/
//array
struct CombinationSumIII {
    
    //Time: O(
    //Space: O(
    //
    //Solution Description:
    //backtracking
    //DFS
    //sorted
    //graph theory
    //n-ary tree
    //
    //Solution Description:
    //Treating the possible combinations as multiple n-ary trees and treating the possible values as an array. Using a
    //DFS backtracking approach we attempt to produce all possible combinations of `candidates` to reach our `target`
    //value. We do this by taking each element in turn from the `candidates` array and performing a DFS from that
    //element until we either reach the `target` value, overshoot or exceed the limit on number of values (to simplifly
    //things we attempt to get to 0 rather than the target, this means we only need to have one parameter to know if the
    //combination is valid i.e. 0 than the two we would need if we attempt to add up to target). Each level that we go
    //down we build up the `combination` array of candidate values that led us to that point. If we reach 0 and have the
    //required number of values then that branch produces a valid combination and we add it to `combinations`; if we go
    //negative or exceed the number of values limit then we abandon that branch, remove the element that caused the
    //overshoot and try the next element in the `combinations` array for that level. As `candidates` can contain the same
    //number multiple times but our result should only have unique values we need to sort `candidatates` and skip any
    //duplicates directly from that levels combinations. It's important to note that the duplicate combinations will still
    //be checked but only once with this approach so avoiding any duplicate combinations that are just out-of-order.
    //We repeat this process until all possible combinations have been tried.
    static func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        let candidates = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var curr = [Int]()
        var combinations = [[Int]]()
        
        dfs(candidates, n, k, 0, &curr, &combinations)
        
        return combinations
    }
    
    private static func dfs(_ candidates: [Int], _ remaining: Int, _ limit: Int, _ startingIndex: Int, _ curr: inout [Int], _ combinations: inout [[Int]]) {
        guard remaining >= 0 else {
            return
        }
        
        guard remaining > 0 else {
            if curr.count == limit { //a combination needs to have exactly `limit` elements and be 0 to be valid
                combinations.append(curr)
            }
            return
        }
        
        guard curr.count < limit else {
            return
        }
        
        for i in startingIndex..<candidates.count {
            let candidate = candidates[i]
            
            var remaining = remaining
            remaining -= candidate
            
            curr.append(candidate)
            dfs(candidates, remaining, limit, (i + 1), &curr, &combinations)
            curr.removeLast()
        }
    }
}
