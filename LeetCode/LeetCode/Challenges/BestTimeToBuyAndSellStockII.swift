//
//  BestTimeToBuyAndSellStockII.swift
//  LeetCode
//
//  Created by William Boles on 01/02/2022.
//

import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
//array
struct BestTimeToBuyAndSellStockII {
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(1)
    //counting
    //greedy
    //Kadanes algorithm
    //
    //Solution Description:
    //To generate profit we need to buy low and sell high. We can do this by always comparing the current price with
    //the next price. If the next price is higher we don't buy and if it lower we do buy and sell that next day. The
    //profit is then banked and we continuing on looking for the next profitable buy/sell combination. We are not
    //trying to find the greatest positive difference instead we are using a greedy approach and taking any positive
    //difference
    static func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        
        for i in 0..<(prices.count - 1) {
            if prices[i] < prices[(i + 1)] {
                profit += prices[(i + 1)] - prices[i]
            }
        }
        
        return max(profit, 0)
    }
}
