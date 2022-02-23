//
//  CombinationSum.swift
//  LeetCode
//
//  Created by William Boles on 23/02/2022.
//

import Foundation

//https://leetcode.com/problems/combination-sum/
//array
struct CombinationSum {
    
    //Time: O(
    //Space: O(
    //backtracking
    //DFS
    //graph theory
    //
    //Solution Description:
    //Treating the possible combinations as a graph. Using a DFS backtracking approach we attempt to produce all possible
    //combinations of `candidates` to reach our `target` value. We do this by taking element in turn from the `candidates`
    //array and performing a DFS from that element until we either reach the `target` value or overshoot (to simplifly
    //things we attempt to get to 0 rather than the target, this means we only need to have one parameter to know if the
    //combination is valid i.e. 0 than the two we would need if we attempt to add up to target). Each level that we go
    //down we build up the `combination` array of candidate values that led us to that point. If we reach 0 then that path
    //of candidate values is a valid combination and we add it to `combinations`; if we go negative then we abandon that
    //branch, remove the element that caused the overshoot and try the next element in the `combinations` array for that
    //level. We repeat this process until all possible combinations have been tried.
    //
    //NB: To avoid duplicate entries in `combinations` we only search "same or forward" in `candidates` array, never
    //"backwards" this avoids us ending up with '[2, 2, 3]' and '[2, 3, 2]' and '[3, 2, 2]' which would be considered
    //the same and need to be removed.
    static func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combinations = [[Int]]()
        var combination = [Int]()
        
        dfs(candidates, target, 0, &combination, &combinations)
        
        return combinations
    }
    
    private static func dfs(_ candidates: [Int], _ remaining: Int, _ startIndex: Int,  _ combination: inout [Int], _ combinations: inout [[Int]]) {
        //constraint
        guard remaining >= 0 else {
            return
        }
        
        //goal
        guard remaining != 0 else {
            combinations.append(combination)
            return
        }
        
        //choice
        for i in startIndex..<candidates.count {
            let candidate = candidates[i]
            combination.append(candidate)
            //first time through `i` will be the same `startIndex` - this is how we can reuse the same value multiple but always
            //in the same position so avoid having duplicate number combinations
            dfs(candidates, (remaining - candidate), i, &combination, &combinations)
            combination.removeLast() //backtrack
        }
    }
}
