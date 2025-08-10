//
//  CoinChange .swift
//  LeetCode
//
//  Created by William Boles on 06/04/2023.
//

import Foundation

//https://leetcode.com/problems/coin-change/
struct CoinChange {
    
    //Time: O(m * n) where n is the `amount`
    //               where m is the number of elements in `coins`
    //Space: O(m)
    //array
    //graph theory
    //BFS
    //iterative
    //memoization
    //dynamic programming
    //set
    //
    //Solution Description:
    //To find the minimum number of coins required we can treat this as graph and use BFS. Each iteration through we take the
    //remaining `amount` value and subtract all possible coin values - adding each new `amount` into the next iteration of the
    //queue. If `amount` drops below 0 then we know that combination of coins isn't valid. If `amount` is zero then we have
    //found the minimum number of coins required (as this traversal is using BFS we know that is the minimum). To avoid
    //repeated work we use a memoization to store each `amount` we have traversed from, if another path takes as to the same
    //amount we know it isn't possible to get to zero from there (if it was possible we would have stopped our traversal before
    //this point.)
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }

        var queue = [(Int, Int)]() //[amount, count]
        queue.append((amount, 0))

        var memo = Set<Int>() //amount

        while !queue.isEmpty {
            var nextQueue = [(Int, Int)]()

            for (amount, count) in queue {
                guard !memo.contains(amount) else {
                    continue
                }
                memo.insert(amount)

                for coin in coins {
                    let amount = amount - coin
                    let count = count + 1

                    guard amount >= 0 else {
                        continue
                    }

                    guard amount > 0 else {
                        return count
                    }
                    
                    nextQueue.append((amount, count))
                }
            }

            queue = nextQueue
        }

        return -1
    }
    
    //Time: O(m * n) where n is the `amount`
    //               where m is the number of elements in `coins`
    //Space: O(m)
    //array
    //DFS
    //memoization
    //top-down
    //dynamic programming
    //recursive
    //graph theory
    //
    //Solution Description:
    //Treating the `coins` array as a graph, we can perform a DFS through all the different permutations attempting to find
    //those that equal `amount`. As we have an infinite number of each coin, at each level of the DFS we are able to use all
    //coins, this means that our "brake" needs to be the `amount`. As this DFS generates the same branches from multiple
    //approaches to avoid duplication of work we use memoization to store the quickest/minimum route from a given `remaining`
    //value to 0 (or burst).
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        
        var memo = [Int: Int]()
        
        let coinsUsed = dfs(coins, &memo, amount)
    
        return coinsUsed == Int.max ? -1: coinsUsed
    }

    private func dfs(_ coins: [Int], _ memo: inout [Int: Int], _ remaining: Int) -> Int {
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
