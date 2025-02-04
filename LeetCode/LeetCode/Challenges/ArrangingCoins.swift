//
//  ArrangingCoins.swift
//  LeetCode
//
//  Created by William Boles on 31/07/2023.
//

import Foundation

//https://leetcode.com/problems/arranging-coins/
struct ArrangingCoins {
    
    //Time: O(log n) where n is the number of coins
    //Space: O(1)
    //array
    //sorted
    //binary search find exact match
    //math
    //
    //Solution Description:
    //As each row is one element greater in size than the previous row and we know that the upper bounds of possible rows is `n`. We
    //can treat the possible rows as a sorted ascending array and so can use binary search to calculate the maximum number of rows
    //needed to fully hold `n` coins - remember a row is only added if it is occupied. As with any binary search, we take the
    //midpoint between `left` and `right` to determine if we have found our target, overshot it or undershot it. We can use `Gauss
    //Summation` formula to calculate how many coins we would need for any given number of rows.
    //
    //N.B. Gauss formula - https://letstalkscience.ca/educational-resources/backgrounders/gauss-summation
    func arrangeCoinsA(_ n: Int) -> Int {
        var left = 0
        var right = n
        
        while left <= right { //want the maximum
            let rows = left + (right - left) / 2
            
            //Gauss Summation formula
            let coinsRequiredToFillRows = (rows * (rows + 1)) / 2 //calculate coins required for `rows`
            
            if coinsRequiredToFillRows == n {
                return rows
            } else if coinsRequiredToFillRows > n {
                right = rows - 1
            } else {
                left = rows + 1
            }
        }
        
        return right
    }
    
    //Time: O(n) where n is the number of coins
    //Space: O(1)
    //array
    //
    //Solution Description:
    //As each row is one element greater in size than the previous row, we can attempt to take a rows worth of coins away from `n` at
    //a time while ensuring that the remaining coins in `n` is always greater than 0. Each time we successfully deduct coins we can
    //increment our `rows` value by 1.
    func arrangeCoins(_ n: Int) -> Int {
        var remainingCoins = n
        var coinsPerRow = 1
        var rows = 0
        
        while remainingCoins >= coinsPerRow {
            remainingCoins -= coinsPerRow
            coinsPerRow += 1
            
            rows += 1
        }
        
        return rows
    }
}
