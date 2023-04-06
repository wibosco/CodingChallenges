//
//  CoinChange .swift
//  LeetCode
//
//  Created by William Boles on 06/04/2023.
//

import Foundation

//https://leetcode.com/problems/coin-change/
//array
struct CoinChange {
    
    //Time: O(
    //Space: O(
    //DFS
    //memoization
    //dynamic programming
    //recursive
    //graph thory
    //
    //Solution Description:
    //Treating the `coins` array as a graph, we can perform a DFS through all the different permutations attempting to find
    //those that equal `amount`. As we have an infinite number of each coin, at each level of the DFS we are able to use all
    //coins, this means that our "brake" needs to be the `amount`. As this DFS generates the same branches from mulitple
    //approaches to avoid duplication of work we use memoization to store the quickest/minimum route from a given `remaining`
    //value to 0 (or burst).
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    static func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        
        var memo = [Int: Int]()
        
        let coinsUsed = dfs(coins, &memo, amount)
    
        return coinsUsed == Int.max ? -1: coinsUsed
    }

    private static func dfs(_ coins: [Int], _ memo: inout [Int: Int], _ remaining: Int) -> Int {
        guard remaining >= 0 else {
            return -1
        }
        
        guard remaining > 0 else {
            return 0
        }
        
        //check if we have already went down the `remaining` branch and can just return the result of the previous effort
        guard memo[remaining] == nil else {
            return memo[remaining]!
        }

        var minCoinsUsedFromHere = Int.max //search all branches but only store the minimum
        for coin in coins { //don't exclude any previously used coin
            let coinsUsedFromHere = dfs(coins, &memo, (remaining - coin))
            
            guard coinsUsedFromHere != -1 else { //branch didn't result in adding to the needed value
                continue
            }
            
            minCoinsUsedFromHere = min(minCoinsUsedFromHere, (coinsUsedFromHere + 1))
        }
                                    
        memo[remaining] = (minCoinsUsedFromHere == Int.max) ? -1 : minCoinsUsedFromHere
        
        return memo[remaining]!
    }
}
