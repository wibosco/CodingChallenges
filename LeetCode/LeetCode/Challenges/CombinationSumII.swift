//
//  CombinationSumII.swift
//  LeetCode
//
//  Created by William Boles on 23/02/2022.
//

import Foundation

//https://leetcode.com/problems/combination-sum-ii/
struct CombinationSumII {
    
    //Time: O(2^n) where n is the number of elements in `candidates`
    //Space: O(n + k) where n is the number of elements in our combination
    //                where k is the number of levels in our tree
    //array
    //backtracking
    //DFS
    //sorted
    //graph theory
    //n-ary tree
    //
    //Solution Description:
    //Treating the possible combinations as multiple n-ary trees. Using a DFS backtracking approach we attempt to produce
    //all possible combinations of `candidates` to reach our `target` value. We do this by taking each element in turn
    //from the `candidates` array and performing a DFS from that element until we either reach the `target` value or
    //overshoot (to simplify things we attempt to get to 0 rather than the target, this means we only need to have one
    //parameter to know if the combination is valid i.e. 0 than the two we would need if we attempt to add up to target).
    //Each level that we go down we build up the `combination` array of candidate values that led us to that point. If we
    //reach 0 then that path of candidate values is a valid combination and we add it to `combinations`; if we go negative
    //then we abandon that branch, remove the element that caused the overshoot and try the next element in the
    //`combinations` array for that level. As `candidates` can contain the same number multiple times but our result
    //should only have unique values we need to sort `candidates` and skip any duplicates directly from that levels
    //combinations. It's important to note that the duplicate combinations will still be checked but only once with this
    //approach so avoiding any duplicate combinations that are just out-of-order. We repeat this process until all possible
    //combinations have been tried.
    //
    //NB: To avoid duplicate entries in `combinations` we only search "same or forward" in `candidates` array, never
    //"backwards" this avoids us ending up with '[2, 2, 3]' and '[2, 3, 2]' and '[3, 2, 2]' which would be considered the
    //same and need to be removed.
    //
    //Similar to: https://leetcode.com/problems/subsets-ii/
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combinations = [[Int]]()
        var curr = [Int]()

        dfs(candidates.sorted(), target, 0, &curr, &combinations)
        
        return combinations
    }
    
    private func dfs(_ candidates: [Int], _ remaining: Int, _ startingIndex: Int, _ curr: inout [Int], _ combinations: inout [[Int]]) {
        guard remaining >= 0 else {
            return
        }
        
        guard remaining > 0 else {
            combinations.append(curr)
            return
        }
        
        for i in startingIndex..<candidates.count {
            if i > startingIndex && candidates[i] == candidates[(i - 1)] {
                //skip duplicates of the same number here
                //we will catch them on through the next DFS call i.e. the next startingIndex will be the duplicate index
                //(hence the first condition of `i > startingIndex`) so for [2, 2, 2, 5] curr will eventually be `[2, 2, 2]`
                //through the DFS call so no need to build that here as well
                continue
            }
            
            let candidate = candidates[i]
            
            var remaining = remaining
            remaining -= candidate
            
            curr.append(candidate)
            dfs(candidates, remaining, (i + 1), &curr, &combinations)
            curr.removeLast()
        }
    }
}
